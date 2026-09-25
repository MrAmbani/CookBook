import 'package:flutter/material.dart';
import 'package:cookbook_client/cookbook_client.dart';

class RecipeResultsScreen extends StatelessWidget {
  final List<RecipeMatch> results;
  const RecipeResultsScreen({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Results')),
      body: results.isEmpty
          ? const Center(child: Text('No recipes found.'))
          : ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final match = results[index];
                final percent = (match.score * 100).round();
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          match.recipe.title,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text('$percent% match · ${match.recipe.prepTime + match.recipe.cookTime} min · ${match.recipe.difficulty}'),
                        if (match.missingIngredients.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            'Missing: ${match.missingIngredients.join(", ")}',
                            style: const TextStyle(color: Colors.orange),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}