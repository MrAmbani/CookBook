import 'package:flutter/material.dart';
import 'package:cookbook_client/cookbook_client.dart';
import '../client.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final int recipeId;
  const RecipeDetailsScreen({super.key, required this.recipeId});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  RecipeDetails? _details;
  bool _isSaved = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final details = await client.recipe.getDetails(widget.recipeId);
    final saved = await client.savedRecipe.isSaved(widget.recipeId);
    if (!mounted) return;
    setState(() {
      _details = details;
      _isSaved = saved;
      _loading = false;
    });
  }

  Future<void> _toggleSave() async {
    if (_isSaved) {
      await client.savedRecipe.unsave(widget.recipeId);
    } else {
      await client.savedRecipe.save(widget.recipeId);
    }
    if (!mounted) return;
    setState(() => _isSaved = !_isSaved);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final recipe = _details!.recipe;
    final ingredients = _details!.ingredients;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        actions: [
          IconButton(
            icon: Icon(_isSaved ? Icons.bookmark : Icons.bookmark_border),
            onPressed: _toggleSave,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(recipe.description, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          Text(
            '${recipe.prepTime} min prep · ${recipe.cookTime} min cook · '
            '${recipe.servings} servings · ${recipe.difficulty}',
            style: const TextStyle(color: Colors.grey),
          ),
          if (recipe.isAiGenerated) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'AI-generated. Verify allergies and quantities.',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
          const SizedBox(height: 16),
          const Text('Ingredients', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...ingredients.map((i) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  '• ${i.quantity}${i.unit != null ? ' ${i.unit}' : ''} ${i.ingredientName}'
                  '${i.isOptional ? ' (optional)' : ''}',
                ),
              )),
          const SizedBox(height: 16),
          const Text('Steps', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(recipe.instructions),
        ],
      ),
    );
  }
}