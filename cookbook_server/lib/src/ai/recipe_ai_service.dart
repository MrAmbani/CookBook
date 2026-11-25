import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'gemini_client.dart';

class GeneratedRecipeData {
  final String title;
  final String description;
  final List<Map<String, dynamic>> ingredients;
  final List<String> steps;
  final int prepTime;
  final int cookTime;
  final int servings;
  final String difficulty;

  GeneratedRecipeData({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.prepTime,
    required this.cookTime,
    required this.servings,
    required this.difficulty,
  });
}

class RecipeAiService {
  /// Calls Gemini to generate a recipe from the given ingredients.
  /// Returns null if no model answered or the answer was unusable twice.
  static Future<GeneratedRecipeData?> generate(
    Session session,
    List<String> ingredients,
  ) async {
    final prompt =
        '''
Create a simple recipe using mainly these ingredients: ${ingredients.join(', ')}.
You may add common pantry items (salt, oil, water, basic spices) if needed.
Respond with ONLY valid JSON, no markdown, no extra text, in this exact shape:
{
  "title": "string",
  "description": "string",
  "ingredients": [{"name": "string", "quantity": "string", "unit": "string or null", "optional": false}],
  "steps": ["string", "string"],
  "prepTime": 0,
  "cookTime": 0,
  "servings": 0,
  "difficulty": "easy|medium|hard"
}
''';

    final request = {
      'contents': [
        {
          'parts': [
            {'text': prompt},
          ],
        },
      ],
    };

    for (var attempt = 0; attempt < 2; attempt++) {
      final text = await GeminiClient.generateText(session, request);
      if (text == null) return null; // every model failed

      try {
        var json = text.trim();
        if (json.startsWith('```')) {
          json = json.replaceAll(RegExp(r'^```json|^```|```$'), '').trim();
        }

        final parsed = jsonDecode(json);

        // Validate required fields and basic sanity.
        if (parsed['title'] == null ||
            parsed['steps'] == null ||
            (parsed['steps'] as List).length < 2 ||
            parsed['ingredients'] == null ||
            (parsed['ingredients'] as List).isEmpty) {
          session.log(
            'Recipe response failed validation (attempt ${attempt + 1})',
            level: LogLevel.warning,
          );
          continue;
        }

        return GeneratedRecipeData(
          title: parsed['title'],
          description: parsed['description'] ?? '',
          ingredients: List<Map<String, dynamic>>.from(parsed['ingredients']),
          steps: List<String>.from(parsed['steps']),
          prepTime: (parsed['prepTime'] ?? 10) as int,
          cookTime: (parsed['cookTime'] ?? 10) as int,
          servings: (parsed['servings'] ?? 2) as int,
          difficulty: parsed['difficulty'] ?? 'easy',
        );
      } catch (e) {
        session.log(
          'Could not read recipe response (attempt ${attempt + 1}): $e',
          level: LogLevel.warning,
        );
      }
    }

    return null;
  }
}
