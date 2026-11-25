import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../client.dart';
import 'ingredient_input_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final _picker = ImagePicker();
  Uint8List? _preview;
  bool _busy = false;

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _scan(ImageSource source) async {
    try {
      // The picker shrinks the photo, so the upload stays small and fast.
      final file = await _picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 70,
      );
      if (file == null) return; // user cancelled

      final bytes = await file.readAsBytes();
      if (!mounted) return;
      if (bytes.length > 1024 * 1024) {
        _showMessage('That photo is too large. Try a different one.');
        return;
      }
      setState(() {
        _preview = bytes;
        _busy = true;
      });

      final names = await client.scan.scanIngredients(
        ByteData.view(bytes.buffer, bytes.offsetInBytes, bytes.lengthInBytes),
      );
      if (!mounted) return;
      if (names == null) {
        _showMessage('AI service is unavailable. Please try again later.');
        return;
      }
      if (names.isEmpty) {
        _showMessage(
            'No ingredients detected. Try a clearer photo or add them manually.');
        return;
      }

      // Map what the AI saw to your ingredient list (synonyms included).
      final checked = await client.ingredient.normalize(names);
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => IngredientInputScreen(
            initialRecognized: checked.recognized,
            initialUnrecognized: checked.unrecognized,
          ),
        ),
      );
    } catch (e) {
      if (e.toString().contains('Authentication required')) {
        _showMessage('Log in to scan ingredients.');
      } else {
        _showMessage('Scan failed: $e');
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Ingredients')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'Take or choose a photo of your ingredients. '
              'You can check and fix the list before searching.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            if (_preview != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.memory(_preview!, height: 220, fit: BoxFit.cover),
              ),
            const SizedBox(height: 24),
            if (_busy) ...[
              const CircularProgressIndicator(),
              const SizedBox(height: 12),
              const Text('Analyzing your photo...'),
            ] else ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.photo_camera),
                  label: const Text('Camera'),
                  onPressed: () => _scan(ImageSource.camera),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Gallery'),
                  onPressed: () => _scan(ImageSource.gallery),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}