import 'package:flutter/material.dart';
import 'package:cookbook_client/cookbook_client.dart';
import '../client.dart';
import 'recipe_details_screen.dart';

class SavedRecipesScreen extends StatefulWidget {
  const SavedRecipesScreen({super.key});

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  late Future<List<Recipe>> _future;

  @override
  void initState() {
    super.initState();
    _future = client.savedRecipe.getSaved();
  }

  void _reload() {
    setState(() => _future = client.savedRecipe.getSaved());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Recipes')),
      body: FutureBuilder<List<Recipe>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Log in to see saved recipes.'));
          }
          final recipes = snapshot.data ?? [];
          if (recipes.isEmpty) {
            return const Center(child: Text('No saved recipes yet.'));
          }
          return ListView(
            children: recipes
                .map((r) => ListTile(
                      title: Text(r.title),
                      subtitle: Text(
                          '${r.prepTime + r.cookTime} min · ${r.difficulty}'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RecipeDetailsScreen(recipeId: r.id!),
                        ),
                      ).then((_) => _reload()),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}