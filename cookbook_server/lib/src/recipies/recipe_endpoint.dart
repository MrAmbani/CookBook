import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

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

      if (requiredLinks.isEmpty) continue; // skip malformed recipes

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

      results.add(RecipeMatch(
        recipe: recipe,
        score: score,
        missingIngredients: missing,
      ));
    }

    results.sort((a, b) {
      final scoreCompare = b.score.compareTo(a.score);
      if (scoreCompare != 0) return scoreCompare;
      return a.missingIngredients.length.compareTo(b.missingIngredients.length);
    });

    return results;
  }
}