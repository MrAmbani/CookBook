import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../auth/auth_helpers.dart';

/// Cleaned, validated values ready to be saved.
class _ValidRecipe {
  final String title;
  final String description;
  final String instructions;
  final int prepTime;
  final int cookTime;
  final int servings;
  final String difficulty;
  final List<NewRecipeIngredient> ingredients;

  _ValidRecipe({
    required this.title,
    required this.description,
    required this.instructions,
    required this.prepTime,
    required this.cookTime,
    required this.servings,
    required this.difficulty,
    required this.ingredients,
  });
}

class ChefRecipeEndpoint extends Endpoint {
  static const _roles = ['chef', 'admin'];

  /// Validates everything and throws on the first problem. Called BEFORE
  /// anything is saved, so a bad request never leaves a half-written recipe.
  static _ValidRecipe _validate({
    required String title,
    required String description,
    required List<String> steps,
    required int prepTime,
    required int cookTime,
    required int servings,
    required String difficulty,
    required List<NewRecipeIngredient> ingredients,
  }) {
    final cleanTitle = title.trim();
    if (cleanTitle.isEmpty || cleanTitle.length > 100) {
      throw Exception('Title must be 1-100 characters');
    }
    final cleanDescription = description.trim();
    if (cleanDescription.length > 300) {
      throw Exception('Description too long (max 300)');
    }
    final cleanSteps = steps
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
    if (cleanSteps.length < 2 || cleanSteps.length > 20) {
      throw Exception('Add between 2 and 20 steps');
    }
    if (prepTime < 0 || prepTime > 600 || cookTime < 0 || cookTime > 600) {
      throw Exception('Times must be between 0 and 600 minutes');
    }
    if (servings < 1 || servings > 50) {
      throw Exception('Servings must be between 1 and 50');
    }
    if (!['easy', 'medium', 'hard'].contains(difficulty)) {
      throw Exception('Invalid difficulty');
    }

    final cleanIngredients = ingredients
        .where((i) => i.name.trim().isNotEmpty)
        .toList();
    if (cleanIngredients.isEmpty || cleanIngredients.length > 30) {
      throw Exception('Add between 1 and 30 ingredients');
    }
    for (final i in cleanIngredients) {
      if (i.name.trim().length > 50 || i.quantity.trim().length > 30) {
        throw Exception('Ingredient name or quantity too long');
      }
    }
    // recommend() scores only required ingredients, so at least one is needed.
    if (cleanIngredients.every((i) => i.isOptional)) {
      throw Exception('At least one ingredient must be required');
    }

    return _ValidRecipe(
      title: cleanTitle,
      description: cleanDescription,
      instructions: [
        for (var i = 0; i < cleanSteps.length; i++)
          '${i + 1}. ${cleanSteps[i]}',
      ].join('\n'),
      prepTime: prepTime,
      cookTime: cookTime,
      servings: servings,
      difficulty: difficulty,
      ingredients: cleanIngredients,
    );
  }

  /// Links [items] to the recipe. Known ingredients are matched by name or
  /// synonym, unknown ones are created.
  static Future<void> _saveIngredients(
    Session session,
    int recipeId,
    List<NewRecipeIngredient> items,
  ) async {
    final known = await Ingredient.db.find(session);
    final lookup = <String, Ingredient>{};
    for (final ing in known) {
      lookup[ing.name.toLowerCase()] = ing;
      for (final syn in ing.synonyms.split(',')) {
        final s = syn.trim().toLowerCase();
        if (s.isNotEmpty) lookup[s] = ing;
      }
    }

    for (final item in items) {
      final name = item.name.trim().toLowerCase();
      var ingredient = lookup[name];
      ingredient ??= await Ingredient.db.insertRow(
        session,
        Ingredient(name: name, category: 'other', synonyms: ''),
      );
      lookup[name] = ingredient;

      final unit = item.unit?.trim();
      await RecipeIngredient.db.insertRow(
        session,
        RecipeIngredient(
          recipeId: recipeId,
          ingredientId: ingredient.id!,
          quantity: item.quantity.trim(),
          unit: (unit == null || unit.isEmpty) ? null : unit,
          isOptional: item.isOptional,
        ),
      );
    }
  }

  /// Chef or admin only.
  Future<Recipe> createRecipe(
    Session session, {
    required String title,
    required String description,
    required List<String> steps,
    required int prepTime,
    required int cookTime,
    required int servings,
    required String difficulty,
    required List<NewRecipeIngredient> ingredients,
  }) async {
    final profile = await AuthHelpers.requireAnyRole(session, _roles);

    final v = _validate(
      title: title,
      description: description,
      steps: steps,
      prepTime: prepTime,
      cookTime: cookTime,
      servings: servings,
      difficulty: difficulty,
      ingredients: ingredients,
    );

    final recipe = await Recipe.db.insertRow(
      session,
      Recipe(
        title: v.title,
        description: v.description,
        instructions: v.instructions,
        prepTime: v.prepTime,
        cookTime: v.cookTime,
        servings: v.servings,
        difficulty: v.difficulty,
        creatorId: profile.userId,
        isAiGenerated: false,
      ),
    );

    await _saveIngredients(session, recipe.id!, v.ingredients);
    return recipe;
  }

  /// Owner or admin only. Replaces the recipe's fields and its whole
  /// ingredient list with the new values.
  Future<Recipe> updateRecipe(
    Session session, {
    required int recipeId,
    required String title,
    required String description,
    required List<String> steps,
    required int prepTime,
    required int cookTime,
    required int servings,
    required String difficulty,
    required List<NewRecipeIngredient> ingredients,
  }) async {
    final profile = await AuthHelpers.requireAnyRole(session, _roles);

    final recipe = await Recipe.db.findById(session, recipeId);
    if (recipe == null) throw Exception('Recipe not found');
    if (recipe.creatorId != profile.userId && profile.role != 'admin') {
      throw Exception('Not allowed to edit this recipe');
    }

    // Validate first: nothing below runs if the new values are bad.
    final v = _validate(
      title: title,
      description: description,
      steps: steps,
      prepTime: prepTime,
      cookTime: cookTime,
      servings: servings,
      difficulty: difficulty,
      ingredients: ingredients,
    );

    recipe.title = v.title;
    recipe.description = v.description;
    recipe.instructions = v.instructions;
    recipe.prepTime = v.prepTime;
    recipe.cookTime = v.cookTime;
    recipe.servings = v.servings;
    recipe.difficulty = v.difficulty;
    final updated = await Recipe.db.updateRow(session, recipe);

    await RecipeIngredient.db.deleteWhere(
      session,
      where: (t) => t.recipeId.equals(recipeId),
    );
    await _saveIngredients(session, recipeId, v.ingredients);

    return updated;
  }

  /// Chef or admin only. The caller's own hand-written recipes, newest first.
  Future<List<Recipe>> myRecipes(Session session) async {
    final profile = await AuthHelpers.requireAnyRole(session, _roles);
    return await Recipe.db.find(
      session,
      where: (t) =>
          t.creatorId.equals(profile.userId) & t.isAiGenerated.equals(false),
      orderBy: (t) => t.id.desc(),
      limit: 100,
    );
  }

  /// Owner or admin only. Also removes the recipe's ingredient links and
  /// every user's bookmark of it, so nothing is left pointing at a deleted row.
  Future<void> deleteRecipe(Session session, int recipeId) async {
    final profile = await AuthHelpers.requireAnyRole(session, _roles);

    final recipe = await Recipe.db.findById(session, recipeId);
    if (recipe == null) return;
    if (recipe.creatorId != profile.userId && profile.role != 'admin') {
      throw Exception('Not allowed to delete this recipe');
    }

    await RecipeIngredient.db.deleteWhere(
      session,
      where: (t) => t.recipeId.equals(recipeId),
    );
    await SavedRecipe.db.deleteWhere(
      session,
      where: (t) => t.recipeId.equals(recipeId),
    );
    await Recipe.db.deleteRow(session, recipe);
  }
}
