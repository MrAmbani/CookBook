import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

/// Models to try, in order. If one is busy (503/429) or no longer exists
/// (404), the next one is tried. Edit this list when Google retires a model.
const List<String> geminiModels = [
  'gemini-3.1-flash-lite',
  'gemini-3.5-flash',
  'gemini-3.8-flash',
  'gemini-2.5-flash-lite',
];

class GeminiClient {
  /// Sends [requestBody] to Gemini and returns the text of the first answer,
  /// or null if every model failed.
  static Future<String?> generateText(
    Session session,
    Map<String, dynamic> requestBody, {
    Duration timeout = const Duration(seconds: 15),
  }) async {
    final apiKey = session.passwords['geminiApiKey'];
    if (apiKey == null) {
      session.log('Gemini API key not configured.', level: LogLevel.warning);
      return null;
    }
    final body = jsonEncode(requestBody);
    final stopwatch = Stopwatch()..start();

    for (final model in geminiModels) {
      // Give up once the whole chain has used 25 seconds in total.
      if (stopwatch.elapsed > const Duration(seconds: 25)) return null;

      for (var attempt = 0; attempt < 1; attempt++) {
        // Short pause before the one retry on the same model.
        if (attempt > 0) await Future.delayed(const Duration(seconds: 2));

        try {
          final response = await http
              .post(
                Uri.parse(
                  'https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent?key=$apiKey',
                ),
                headers: {'Content-Type': 'application/json'},
                body: body,
              )
              .timeout(timeout);

          if (response.statusCode == 200) {
            final decoded = jsonDecode(response.body);
            final text =
                decoded['candidates'][0]['content']['parts'][0]['text'];
            if (text is String) return text;
            break; // unexpected shape: try the next model
          }

          final snippet = response.body.length > 200
              ? response.body.substring(0, 200)
              : response.body;
          session.log(
            'Gemini $model error (attempt ${attempt + 1}): '
            '${response.statusCode} $snippet',
            level: LogLevel.warning,
          );

          final temporary =
              response.statusCode == 429 || response.statusCode >= 500;
          if (!temporary) break; // e.g. 404 retired model: next model
        } catch (e) {
          // Error text can contain the request URL, which includes the key.
          final safe = e.toString().replaceAll(apiKey, '***');
          session.log(
            'Gemini $model call failed (attempt ${attempt + 1}): $safe',
            level: LogLevel.warning,
          );
        }
      }
    }

    return null; // every model failed
  }
}
