import 'package:blogz/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blogz"),
        actions: [
          Consumer<AuthProvider>(
            builder: (context, provider, child) {
              // 1. You must RETURN the widget here
              return IconButton(
                icon: const Icon(Icons.logout_outlined),
                // 2. Wrap the function call in an anonymous function () => ...
                // 3. Call the method on the 'provider' instance
                onPressed: () => provider.signOut(),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("qwe qwe", style: TextStyle(color: Colors.blueGrey)),
      ),
    );
  }
}
