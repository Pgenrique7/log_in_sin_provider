import 'package:flutter/material.dart';
import 'package:log_aplication/presentation/widgets/login_form.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Log in')),
        backgroundColor:Theme.of(context).colorScheme.primary
      ),
      body: const LogInForm(),
    );
  }
}
