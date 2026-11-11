import 'package:flutter/material.dart';
import 'package:cookbook_client/cookbook_client.dart';
import '../client.dart';
import 'recipe_details_screen.dart';

class RecipeResultsScreen extends StatefulWidget {
  final List<RecipeMatch> results;
  final List<String> haveIngredients;
  const RecipeResultsScreen({
    super.key,
    required this.results,
    required this.haveIngredients,
  });

  @override
  State<RecipeResultsScreen> createState() => _RecipeResultsScreenState();
}

class _RecipeResultsScreenState extends State<RecipeResultsScreen> {
  bool _generating = false;

  bool get _needsAi =>
      widget.results.isEmpty || widget.results.first.score < 0.5;

  Future<void> _generate() async {
    setState(() => _generating = true);
    try {
      final details = await client.recipe.generate(widget.haveIngredients);
      if (!mounted) return;
      if (details == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('AI service is unavailable. Please try again later.'),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RecipeDetailsScreen(recipeId: details.recipe.id!),
          ),
        );
      }
    } catch (e) {
      debugPrint('GENERATE FAILED: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not generate a recipe: $e')),
      );
    } finally {
      if (mounted) setState(() => _generating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Results')),
      body: Column(
        children: [
          if (_needsAi)
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _generating ? null : _generate,
                  icon: _generating
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.auto_awesome),
                  label: Text(_generating
                      ? 'Generating...'
                      : 'No good match? Generate a recipe with AI'),
                ),
              ),
            ),
          Expanded(
            child: widget.results.isEmpty
                ? const Center(child: Text('No recipes found.'))
                : ListView.builder(
                    itemCount: widget.results.length,
                    itemBuilder: (context, index) {
                      final match = widget.results[index];
                      final percent = (match.score * 100).round();
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RecipeDetailsScreen(
                                  recipeId: match.recipe.id!),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  match.recipe.title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                    '$percent% match · ${match.recipe.prepTime + match.recipe.cookTime} min · ${match.recipe.difficulty}'),
                                if (match.missingIngredients.isNotEmpty) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    'Missing: ${match.missingIngredients.join(", ")}',
                                    style:
                                        const TextStyle(color: Colors.orange),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}