import 'package:flutter/material.dart';
import '../client.dart';
import 'recipe_results_screen.dart';

class IngredientInputScreen extends StatefulWidget {
  /// Pre-filled lists, used when arriving from the photo scan.
  final List<String> initialRecognized;
  final List<String> initialUnrecognized;

  const IngredientInputScreen({
    super.key,
    this.initialRecognized = const [],
    this.initialUnrecognized = const [],
  });

  @override
  State<IngredientInputScreen> createState() => _IngredientInputScreenState();
}

class _IngredientInputScreenState extends State<IngredientInputScreen> {
  final _textController = TextEditingController();
  final List<String> _recognized = [];
  final List<String> _unrecognized = [];

  @override
  void initState() {
    super.initState();
    _recognized.addAll(widget.initialRecognized);
    _unrecognized.addAll(widget.initialUnrecognized);
  }

  Future<void> _addIngredient() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    _textController.clear();

    try {
      final result = await client.ingredient.normalize([text]);
      setState(() {
        for (final name in result.recognized) {
          if (!_recognized.contains(name)) _recognized.add(name);
        }
        for (final name in result.unrecognized) {
          if (!_unrecognized.contains(name)) _unrecognized.add(name);
        }
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot reach the server. Is it running?')),
      );
    }
  }

  void _removeRecognized(String name) {
    setState(() => _recognized.remove(name));
  }

  void _removeUnrecognized(String name) {
    setState(() => _unrecognized.remove(name));
  }

  /// User can choose to keep an unrecognized item anyway (SRS: keep or
  /// remove). It just won't match any recipe ingredient.
  void _keepUnrecognizedAnyway(String name) {
    setState(() {
      _unrecognized.remove(name);
      if (!_recognized.contains(name)) _recognized.add(name);
    });
  }

  Future<void> _findRecipes() async {
    try {
      final results = await client.recipe.recommend(_recognized);
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => RecipeResultsScreen(
            results: results,
            haveIngredients: List.of(_recognized),
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not load recipes. Is the server running?'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final fromScan =
        widget.initialRecognized.isNotEmpty || widget.initialUnrecognized.isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('What do you have?')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (fromScan)
              const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  'Check the list from your photo: remove mistakes and add anything missing.',
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Add an ingredient',
                    ),
                    onSubmitted: (_) => _addIngredient(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addIngredient,
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_recognized.isNotEmpty) ...[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recognized',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Wrap(
                spacing: 8,
                children: _recognized
                    .map((i) => Chip(
                          label: Text(i),
                          onDeleted: () => _removeRecognized(i),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 12),
            ],
            if (_unrecognized.isNotEmpty) ...[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Not recognized: tap to keep anyway',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
              Wrap(
                spacing: 8,
                children: _unrecognized
                    .map((i) => ActionChip(
                          label: Text(i),
                          backgroundColor: Colors.orange.shade100,
                          onPressed: () => _keepUnrecognizedAnyway(i),
                          avatar: GestureDetector(
                            onTap: () => _removeUnrecognized(i),
                            child: const Icon(Icons.close, size: 16),
                          ),
                        ))
                    .toList(),
              ),
            ],
            const Spacer(),
            ElevatedButton(
              onPressed: _recognized.isEmpty ? null : _findRecipes,
              child: const Text('Find Recipes'),
            ),
          ],
        ),
      ),
    );
  }
}