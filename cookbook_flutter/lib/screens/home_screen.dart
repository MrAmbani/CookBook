import 'package:flutter/material.dart';
import 'package:cookbook_client/cookbook_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart'
    hide UserProfile;
import '../client.dart';
import 'sign_in_screen.dart';
import 'ingredient_input_screen.dart';
import 'search_screen.dart';
import 'saved_recipes_screen.dart';
import 'feed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserProfile? _profile;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final profile = await client.profile.getProfile();
      if (!mounted) return;
      setState(() {
        _profile = profile;
        _loading = false;
      });
    } catch (e) {
      // Guest user or server unreachable: show the guest view.
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _editName() async {
    final controller = TextEditingController(text: _profile?.name ?? '');
    final newName = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your name'),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: const Text('Save'),
          ),
        ],
      ),
    );
    if (newName == null || newName.isEmpty || _profile == null) return;
    try {
      final updated = await client.profile
          .updateProfile(name: newName, bio: _profile!.bio);
      if (!mounted) return;
      setState(() => _profile = updated);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not update name: $e')),
      );
    }
  }

  Widget _menuButton(IconData icon, String label, Widget Function() page) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final name = _profile?.name ?? 'Guest';
    final role = _profile?.role;

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
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text('Hello, $name'),
                    subtitle:
                        Text(role == null ? 'Not logged in' : 'Role: $role'),
                    trailing: _profile == null
                        ? null
                        : IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: _editName,
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                _menuButton(Icons.kitchen, 'Find Recipes',
                    () => const IngredientInputScreen()),
                _menuButton(
                    Icons.search, 'Search Recipes', () => const SearchScreen()),
                _menuButton(Icons.bookmark, 'Saved Recipes',
                    () => const SavedRecipesScreen()),
                _menuButton(Icons.forum, 'Community', () => const FeedScreen()),
              ],
            ),
    );
  }
}