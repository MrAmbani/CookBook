import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Seeds ingredients and recipes if the database is empty.
/// Called once from server.dart at startup.
Future<void> seedIfEmpty(Session session) async {
  final existing = await Ingredient.db.find(session, limit: 1);
  if (existing.isNotEmpty) return; // already seeded

  session.log('Seeding ingredients and recipes...');

  final ingredientsData = <Map<String, String>>[
    {'name': 'tomato', 'category': 'vegetable', 'synonyms': 'tamatar,tomatoes'},
    {'name': 'onion', 'category': 'vegetable', 'synonyms': 'pyaz,onions'},
    {'name': 'potato', 'category': 'vegetable', 'synonyms': 'aloo,aalu,potatoes'},
    {'name': 'garlic', 'category': 'vegetable', 'synonyms': 'lahsun,garlic cloves'},
    {'name': 'ginger', 'category': 'vegetable', 'synonyms': 'adrak'},
    {'name': 'rice', 'category': 'grain', 'synonyms': 'chawal'},
    {'name': 'wheat flour', 'category': 'grain', 'synonyms': 'atta,flour'},
    {'name': 'salt', 'category': 'spice', 'synonyms': 'namak'},
    {'name': 'turmeric', 'category': 'spice', 'synonyms': 'haldi'},
    {'name': 'cumin', 'category': 'spice', 'synonyms': 'jeera'},
    {'name': 'coriander', 'category': 'spice', 'synonyms': 'dhania,cilantro'},
    {'name': 'red chili powder', 'category': 'spice', 'synonyms': 'mirchi,chilli powder'},
    {'name': 'oil', 'category': 'other', 'synonyms': 'cooking oil,tel'},
    {'name': 'ghee', 'category': 'dairy', 'synonyms': 'clarified butter'},
    {'name': 'milk', 'category': 'dairy', 'synonyms': 'doodh'},
    {'name': 'paneer', 'category': 'dairy', 'synonyms': 'cottage cheese'},
    {'name': 'egg', 'category': 'other', 'synonyms': 'eggs,anda'},
    {'name': 'bread', 'category': 'grain', 'synonyms': 'pav'},
    {'name': 'lentils', 'category': 'pulse', 'synonyms': 'dal,daal'},
    {'name': 'chickpeas', 'category': 'pulse', 'synonyms': 'chana,chole'},
  ];

  final ingredientMap = <String, int>{}; // name -> id
  for (final data in ingredientsData) {
    final saved = await Ingredient.db.insertRow(
      session,
      Ingredient(
        name: data['name']!,
        category: data['category']!,
        synonyms: data['synonyms']!,
      ),
    );
    ingredientMap[data['name']!] = saved.id!;
  }

  Future<void> addRecipe({
    required String title,
    required String description,
    required String instructions,
    required int prepTime,
    required int cookTime,
    required int servings,
    required String difficulty,
    required List<(String, String, String?, bool)> ingredients,
    // (ingredientName, quantity, unit, isOptional)
  }) async {
    final recipe = await Recipe.db.insertRow(
      session,
      Recipe(
        title: title,
        description: description,
        instructions: instructions,
        prepTime: prepTime,
        cookTime: cookTime,
        servings: servings,
        difficulty: difficulty,
        isAiGenerated: false,
      ),
    );
    for (final (name, qty, unit, optional) in ingredients) {
      await RecipeIngredient.db.insertRow(
        session,
        RecipeIngredient(
          recipeId: recipe.id!,
          ingredientId: ingredientMap[name]!,
          quantity: qty,
          unit: unit,
          isOptional: optional,
        ),
      );
    }
  }

  await addRecipe(
    title: 'Simple Tomato Onion Curry',
    description: 'A quick everyday curry base.',
    instructions:
        '1. Heat oil, add cumin.\n2. Add onion, cook until golden.\n3. Add garlic and ginger.\n4. Add tomato, cook until soft.\n5. Add turmeric, chili powder, salt. Simmer 5 min.',
    prepTime: 10,
    cookTime: 15,
    servings: 2,
    difficulty: 'easy',
    ingredients: [
      ('onion', '2', null, false),
      ('tomato', '3', null, false),
      ('garlic', '4 cloves', null, false),
      ('ginger', '1 inch', null, false),
      ('oil', '2', 'tbsp', false),
      ('cumin', '1', 'tsp', false),
      ('turmeric', '0.5', 'tsp', false),
      ('red chili powder', '1', 'tsp', true),
      ('salt', '1', 'tsp', false),
    ],
  );

  await addRecipe(
    title: 'Boiled Egg and Toast',
    description: 'Fast protein breakfast.',
    instructions: '1. Boil eggs 8 min.\n2. Toast bread.\n3. Peel eggs, season with salt.',
    prepTime: 2,
    cookTime: 10,
    servings: 1,
    difficulty: 'easy',
    ingredients: [
      ('egg', '2', null, false),
      ('bread', '2', 'slices', false),
      ('salt', '1', 'pinch', true),
    ],
  );

  await addRecipe(
    title: 'Simple Dal',
    description: 'Basic lentil curry.',
    instructions:
        '1. Boil lentils with turmeric and salt until soft.\n2. Heat ghee, add cumin.\n3. Pour over dal, mix.',
    prepTime: 5,
    cookTime: 25,
    servings: 3,
    difficulty: 'easy',
    ingredients: [
      ('lentils', '1', 'cup', false),
      ('turmeric', '0.5', 'tsp', false),
      ('salt', '1', 'tsp', false),
      ('ghee', '1', 'tbsp', false),
      ('cumin', '1', 'tsp', false),
    ],
  );

  await addRecipe(
    title: 'Chickpea Salad',
    description: 'No-cook protein salad.',
    instructions: '1. Mix chickpeas, onion, tomato.\n2. Add salt and coriander.',
    prepTime: 10,
    cookTime: 0,
    servings: 2,
    difficulty: 'easy',
    ingredients: [
      ('chickpeas', '1', 'cup', false),
      ('onion', '1', null, false),
      ('tomato', '1', null, false),
      ('salt', '0.5', 'tsp', false),
      ('coriander', '2', 'tbsp', true),
    ],
  );

  await addRecipe(
    title: 'Paneer Bhurji',
    description: 'Scrambled cottage cheese, quick and filling.',
    instructions:
        '1. Heat oil, add onion, cook until soft.\n2. Add tomato, turmeric, chili powder.\n3. Crumble in paneer, mix, cook 3 min.\n4. Add salt, garnish with coriander.',
    prepTime: 10,
    cookTime: 10,
    servings: 2,
    difficulty: 'easy',
    ingredients: [
      ('paneer', '200', 'g', false),
      ('onion', '1', null, false),
      ('tomato', '1', null, false),
      ('oil', '1', 'tbsp', false),
      ('turmeric', '0.25', 'tsp', false),
      ('red chili powder', '0.5', 'tsp', true),
      ('salt', '1', 'tsp', false),
      ('coriander', '1', 'tbsp', true),
    ],
  );

  session.log('Seeding complete: ${ingredientsData.length} ingredients, 5 recipes.');
}