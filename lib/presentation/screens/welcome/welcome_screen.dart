import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  static const String name = 'welcome_screen';

  const WelcomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Bienvenido")),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.goNamed('home_screen');
            },
          ),
        ],
      ),
      body: const Center(child: Text('WELCOME')),
    );
  }
}
