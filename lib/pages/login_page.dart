import 'package:blogz/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    if (provider.errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          provider.errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    provider.isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              context.read<AuthProvider>().signIn(
                                _emailController.text.trim(),
                                _passwordController.text,
                              );
                            },
                            child: const Text('Login'),
                          ),
                  ],
                );
              },
            ),
            TextButton(
              onPressed: () => context.push('/register'),
              child: const Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
