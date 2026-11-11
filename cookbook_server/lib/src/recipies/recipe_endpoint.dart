import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../ai/recipe_ai_service.dart';

class RecipeEndpoint extends Endpoint {
  /// Returns recipes ranked by how many of [haveIngredients] (canonical
  /// ingredient names) they need, best match first.
  Future<List<RecipeMatch>> recommend(
    Session session,
    List<String> haveIngredients,
  ) async {
    final have = haveIngredients.map((e) => e.toLowerCase().trim()).toSet();

    final recipes = await Recipe.db.find(session);
    final allLinks = await RecipeIngredient.db.find(session);
    final allIngredients = await Ingredient.db.find(session);
    final ingredientNameById = {
      for (final i in allIngredients) i.id!: i.name,
    };

    final results = <RecipeMatch>[];

    for (final recipe in recipes) {
      final links = allLinks.where((l) => l.recipeId == recipe.id).toList();
      final requiredLinks = links.where((l) => !l.isOptional).toList();

      if (requiredLinks.isEmpty) continue;

      final matched = requiredLinks.where((l) {
        final name = ingredientNameById[l.ingredientId];
        return name != null && have.contains(name.toLowerCase());
      }).length;

      final score = matched / requiredLinks.length;

      final missing = requiredLinks
          .where((l) {
            final name = ingredientNameById[l.ingredientId];
            return name == null || !have.contains(name.toLowerCase());
          })
          .map((l) => ingredientNameById[l.ingredientId] ?? 'unknown')
          .toList();

      results.add(
        RecipeMatch(
          recipe: recipe,
          score: score,
          missingIngredients: missing,
        ),
      );
    }

    results.sort((a, b) {
      final scoreCompare = b.score.compareTo(a.score);
      if (scoreCompare != 0) return scoreCompare;
      return a.missingIngredients.length.compareTo(b.missingIngredients.length);
    });

    return results;
  }

  /// Returns full details (ingredients with quantities) for one recipe.
  Future<RecipeDetails> getDetails(Session session, int recipeId) async {
    final recipe = await Recipe.db.findById(session, recipeId);
    if (recipe == null) throw Exception('Recipe not found');

    final links = await RecipeIngredient.db.find(
      session,
      where: (t) => t.recipeId.equals(recipeId),
    );
    final allIngredients = await Ingredient.db.find(session);
    final nameById = {for (final i in allIngredients) i.id!: i.name};

    final details = links
        .map(
          (l) => RecipeIngredientDetail(
            ingredientName: nameById[l.ingredientId] ?? 'unknown',
            quantity: l.quantity,
            unit: l.unit,
            isOptional: l.isOptional,
          ),
        )
        .toList();

    return RecipeDetails(recipe: recipe, ingredients: details);
  }

  /// Generates a recipe with AI from [haveIngredients], saves it, and
  /// returns its details. Returns null if the AI service fails.
  Future<RecipeDetails?> generate(
    Session session,
    List<String> haveIngredients,
  ) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) throw Exception('Authentication required');
    if (haveIngredients.isEmpty) throw Exception('No ingredients given');

    final data = await RecipeAiService.generate(session, haveIngredients);
    if (data == null) return null;

    final recipe = await Recipe.db.insertRow(
      session,
      Recipe(
        title: data.title,
        description: data.description,
        instructions: [
          for (var i = 0; i < data.steps.length; i++)
            '${i + 1}. ${data.steps[i]}',
        ].join('\n'),
        prepTime: data.prepTime,
        cookTime: data.cookTime,
        servings: data.servings,
        difficulty: data.difficulty,
        creatorId: userId,
        isAiGenerated: true,
      ),
    );

    // Lookup of known ingredients by name and synonym.
    final existing = await Ingredient.db.find(session);
    final lookup = <String, Ingredient>{};
    for (final ing in existing) {
      lookup[ing.name.toLowerCase()] = ing;
      for (final syn in ing.synonyms.split(',')) {
        final s = syn.trim().toLowerCase();
        if (s.isNotEmpty) lookup[s] = ing;
      }
    }

    final details = <RecipeIngredientDetail>[];
    for (final item in data.ingredients) {
      final name = item['name'].toString().trim().toLowerCase();
      if (name.isEmpty) continue;

      var ingredient = lookup[name];
      ingredient ??= await Ingredient.db.insertRow(
        session,
        Ingredient(name: name, category: 'other', synonyms: ''),
      );
      lookup[name] = ingredient;

      final rawUnit = item['unit']?.toString().trim();
      final unit = (rawUnit == null || rawUnit.isEmpty || rawUnit == 'null')
          ? null
          : rawUnit;
      final quantity = item['quantity']?.toString() ?? '';
      final optional = item['optional'] == true;

      await RecipeIngredient.db.insertRow(
        session,
        RecipeIngredient(
          recipeId: recipe.id!,
          ingredientId: ingredient.id!,
          quantity: quantity,
          unit: unit,
          isOptional: optional,
        ),
      );
      details.add(
        RecipeIngredientDetail(
          ingredientName: ingredient.name,
          quantity: quantity,
          unit: unit,
          isOptional: optional,
        ),
      );
    }

    return RecipeDetails(recipe: recipe, ingredients: details);
  }
}
