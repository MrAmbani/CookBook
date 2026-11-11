import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

const String _geminiModel = 'gemini-3.8-flash';

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
  /// Retries with a growing delay on temporary errors (429, 5xx).
  /// Returns null if all attempts fail.
  static Future<GeneratedRecipeData?> generate(
    Session session,
    List<String> ingredients,
  ) async {
    final apiKey = session.passwords['geminiApiKey'];
    if (apiKey == null) {
      session.log('Gemini API key not configured.', level: LogLevel.warning);
      return null;
    }

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

    const maxAttempts = 3;

    for (var attempt = 0; attempt < maxAttempts; attempt++) {
      // Wait before retrying: 2s, then 4s.
      if (attempt > 0) {
        await Future.delayed(Duration(seconds: 2 * attempt));
      }

      try {
        final response = await http
            .post(
              Uri.parse(
                'https://generativelanguage.googleapis.com/v1beta/models/$_geminiModel:generateContent?key=$apiKey',
              ),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                'contents': [
                  {
                    'parts': [
                      {'text': prompt},
                    ],
                  },
                ],
              }),
            )
            .timeout(const Duration(seconds: 30));

        if (response.statusCode != 200) {
          session.log(
            'Gemini API error (attempt ${attempt + 1}): '
            '${response.statusCode} ${response.body}',
            level: LogLevel.warning,
          );
          final temporary =
              response.statusCode == 429 || response.statusCode >= 500;
          if (temporary) continue; // retry after the delay
          return null; // wrong key/model etc: retrying won't help
        }

        final body = jsonDecode(response.body);
        var text =
            body['candidates'][0]['content']['parts'][0]['text'] as String;

        // Strip markdown code fences if the model added them anyway.
        text = text.trim();
        if (text.startsWith('```')) {
          text = text.replaceAll(RegExp(r'^```json|^```|```$'), '').trim();
        }

        final parsed = jsonDecode(text);

        // Validate required fields and basic sanity.
        if (parsed['title'] == null ||
            parsed['steps'] == null ||
            (parsed['steps'] as List).length < 2 ||
            parsed['ingredients'] == null ||
            (parsed['ingredients'] as List).isEmpty) {
          session.log(
            'Gemini response failed validation (attempt ${attempt + 1})',
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
          'Gemini call failed (attempt ${attempt + 1}): $e',
          level: LogLevel.warning,
        );
      }
    }

    return null; // all attempts failed
  }
}
