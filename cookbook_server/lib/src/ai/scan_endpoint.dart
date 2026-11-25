import 'dart:typed_data';
import 'package:serverpod/serverpod.dart';
import 'vision_ai_service.dart';

class ScanEndpoint extends Endpoint {
  // The app shrinks photos to about 1024 px first, so real photos are far
  // below this. The server still enforces it in case someone skips the app.
  static const _maxBytes = 1024 * 1024; // 1 MB

  /// Logged-in users only. Returns the ingredient names seen in the photo,
  /// or null if the AI service is unavailable.
  Future<List<String>?> scanIngredients(Session session, ByteData image) async {
    final userId = session.authenticated?.userIdentifier;
    if (userId == null) throw Exception('Authentication required');

    final bytes = image.buffer.asUint8List(
      image.offsetInBytes,
      image.lengthInBytes,
    );
    if (bytes.isEmpty) throw Exception('Empty image');
    if (bytes.length > _maxBytes) throw Exception('Image too large (max 1 MB)');

    final mimeType = _detectMimeType(bytes);
    if (mimeType == null) {
      throw Exception('Only JPEG and PNG images are allowed');
    }

    return await VisionAiService.detectIngredients(session, bytes, mimeType);
  }

  /// Checks the file's first bytes, so a renamed file cannot pass as a photo.
  static String? _detectMimeType(Uint8List b) {
    if (b.length > 3 && b[0] == 0xFF && b[1] == 0xD8 && b[2] == 0xFF) {
      return 'image/jpeg';
    }
    if (b.length > 8 &&
        b[0] == 0x89 &&
        b[1] == 0x50 &&
        b[2] == 0x4E &&
        b[3] == 0x47) {
      return 'image/png';
    }
    return null;
  }
}
