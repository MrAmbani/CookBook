import 'ingredient_input_screen.dart';
import 'package:flutter/material.dart';
import '../client.dart';
import 'sign_in_screen.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CookBook'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await client.auth.signOutDevice();
              if (!context.mounted) return;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SignInScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const IngredientInputScreen()),
                  ),
                  child: const Text('Find Recipes'),
                ),
        ),
      );
  }
}