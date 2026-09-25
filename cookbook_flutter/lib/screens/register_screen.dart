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
  late final EmailAuthController _controller;
  String? _error;
  bool _loading = false;
  String _savedPassword = '';

  @override
  void initState() {
    super.initState();
    _controller = EmailAuthController(
      client: client,
      startScreen: EmailFlowScreen.startRegistration,  
      onAuthenticated: () {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      },
      onError: (error) {
        if (!mounted) return;
        setState(() {
          _error = 'Registration failed: $error';
          _loading = false;
        });
      },
    );
  }

  Future<void> _register() async {
    setState(() {
      _error = null;
      _loading = true;
    });

    // Save the password now — the controller's own field can get cleared
    // partway through the multi-step registration flow.
    _savedPassword = _controller.passwordController.text;

    await _controller.startRegistration();
    if (!mounted) return;
    if (_error != null) return; // onError already fired and reset _loading

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

    _controller.verificationCodeController.text = code;
    await _controller.verifyRegistrationCode();
    if (!mounted) return;
    if (_error != null) return;

    // Re-set the password before finishing — confirmed necessary earlier.
    _controller.passwordController.text = _savedPassword;
    await _controller.finishRegistration();
    // Navigation on success is handled by onAuthenticated above.
    if (mounted) setState(() => _loading = false);
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
              controller: _controller.emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controller.passwordController,
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