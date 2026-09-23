import 'package:flutter/material.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import '../client.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _error;
  bool _loading = false;

  Future<void> _register() async {
    setState(() {
      _error = null;
      _loading = true;
    });

    try {
      final controller = EmailAuthController(client: client);
      controller.emailController.text = _emailController.text.trim();
      controller.passwordController.text = _passwordController.text;

      await controller.startRegistration();
      if (!mounted) return;

      final code = await showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          final codeController = TextEditingController();
          return AlertDialog(
            title: const Text('Enter verification code'),
            content: TextField(
              controller: codeController,
              decoration: const InputDecoration(
                labelText: 'Check the server terminal for the code',
              ),
              keyboardType: TextInputType.number,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, codeController.text.trim()),
                child: const Text('Submit'),
              ),
            ],
          );
        },
      );

      if (code == null || code.isEmpty) {
        setState(() => _loading = false);
        return;
      }

      controller.verificationCodeController.text = code;
      await controller.verifyRegistrationCode();

      // Re-set the password in case the controller cleared it after verification
      controller.passwordController.text = _passwordController.text;
      await controller.finishRegistration();

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } catch (e) {
      setState(() => _error = 'Registration failed: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _loading ? null : _register,
              child: _loading
                  ? const CircularProgressIndicator()
                  : const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}