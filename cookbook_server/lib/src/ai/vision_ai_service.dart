import 'dart:convert';
import 'dart:typed_data';
import 'package:serverpod/serverpod.dart';
import 'gemini_client.dart';

class VisionAiService {
  /// Asks Gemini which food ingredients are visible in [imageBytes].
  /// Returns cleaned lowercase names (possibly an empty list), or null if
  /// the AI service could not be reached.
  static Future<List<String>?> detectIngredients(
    Session session,
    Uint8List imageBytes,
    String mimeType,
  ) async {
    const prompt = '''
List the food ingredients clearly visible in this image.
Use simple, common, lowercase English names such as tomato, onion, egg, milk.
Do not list brand names, finished dishes, utensils or packaging.
If no food is visible, return an empty list.
Respond with ONLY valid JSON, no markdown, in this exact shape:
{"ingredients":[{"name":"string","confidence":0.0}]}
confidence is a number from 0 to 1.
''';

    final request = {
      'contents': [
        {
          'parts': [
            {
              'inline_data': {
                'mime_type': mimeType,
                'data': base64Encode(imageBytes),
              },
            },
            {'text': prompt},
          ],
        },
      ],
      'generationConfig': {'responseMimeType': 'application/json'},
    };

    for (var attempt = 0; attempt < 2; attempt++) {
      final text = await GeminiClient.generateText(
        session,
        request,
        timeout: const Duration(seconds: 15),
      );
      if (text == null) return null; // every model failed

      try {
        var json = text.trim();
        if (json.startsWith('```')) {
          json = json.replaceAll(RegExp(r'^```json|^```|```$'), '').trim();
        }

        final parsed = jsonDecode(json);
        final raw = parsed['ingredients'];
        if (raw is! List) {
          session.log(
            'Vision response had no ingredients list (attempt ${attempt + 1})',
            level: LogLevel.warning,
          );
          continue;
        }

        // Clean up: lowercase, no duplicates, drop low-confidence guesses.
        final names = <String>[];
        for (final item in raw) {
          if (item is! Map) continue;
          final name = item['name']?.toString().trim().toLowerCase() ?? '';
          final confidence = item['confidence'] is num
              ? (item['confidence'] as num).toDouble()
              : 0.5;
          if (name.isEmpty || name.length > 50 || confidence < 0.3) continue;
          if (!names.contains(name)) names.add(name);
          if (names.length >= 20) break;
        }
        return names; // an empty list is valid: nothing edible seen
      } catch (e) {
        session.log(
          'Could not read vision response (attempt ${attempt + 1}): $e',
          level: LogLevel.warning,
        );
      }
    }

    return null;
  }
}
