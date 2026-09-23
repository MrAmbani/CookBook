import 'package:flutter/material.dart';
import '../client.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CookBook')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final profile = await client.profile.getProfile();
            debugPrint('userId: ${profile.userId}, role: ${profile.role}');
          },
          child: const Text('Get My Profile (check console)'),
        ),
      ),
    );
  }
}