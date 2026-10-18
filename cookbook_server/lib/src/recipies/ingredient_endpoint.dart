import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class IngredientEndpoint extends Endpoint {
  /// Maps free-typed ingredient names to canonical names using the
  /// Ingredient table's name + synonyms fields. Case-insensitive.
  Future<NormalizedIngredients> normalize(
    Session session,
    List<String> rawInputs,
  ) async {
    final allIngredients = await Ingredient.db.find(session);

    // Build a lookup: every known name/synonym (lowercase) -> canonical name.
    final lookup = <String, String>{};
    for (final ingredient in allIngredients) {
      lookup[ingredient.name.toLowerCase()] = ingredient.name;
      final synonyms = ingredient.synonyms.split(',');
      for (final syn in synonyms) {
        final trimmed = syn.trim().toLowerCase();
        if (trimmed.isNotEmpty) {
          lookup[trimmed] = ingredient.name;
        }
      }
    }

    final recognized = <String>{};
    final unrecognized = <String>[];

    for (final raw in rawInputs) {
      final cleaned = raw.trim().toLowerCase();
      if (cleaned.isEmpty) continue;
      final canonical = lookup[cleaned];
      if (canonical != null) {
        recognized.add(canonical);
      } else {
        unrecognized.add(raw.trim());
      }
    }

    return NormalizedIngredients(
      recognized: recognized.toList(),
      unrecognized: unrecognized,
    );
  }
}