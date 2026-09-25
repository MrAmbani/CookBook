import 'package:flutter/material.dart';
import '../client.dart';
import 'recipe_results_screen.dart';

class IngredientInputScreen extends StatefulWidget {
  const IngredientInputScreen({super.key});

  @override
  State<IngredientInputScreen> createState() => _IngredientInputScreenState();
}

class _IngredientInputScreenState extends State<IngredientInputScreen> {
  final _textController = TextEditingController();
  final List<String> _ingredients = [];

  void _addIngredient() {
    final text = _textController.text.trim().toLowerCase();
    if (text.isEmpty) return;
    if (!_ingredients.contains(text)) {
      setState(() => _ingredients.add(text));
    }
    _textController.clear();
  }

  void _removeIngredient(String ingredient) {
    setState(() => _ingredients.remove(ingredient));
  }

  Future<void> _findRecipes() async {
    final results = await client.recipe.recommend(_ingredients);
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => RecipeResultsScreen(results: results)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('What do you have?')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
            Wrap(
              spacing: 8,
              children: _ingredients
                  .map((i) => Chip(
                        label: Text(i),
                        onDeleted: () => _removeIngredient(i),
                      ))
                  .toList(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _ingredients.isEmpty ? null : _findRecipes,
              child: const Text('Find Recipes'),
            ),
          ],
        ),
      ),
    );
  }
}