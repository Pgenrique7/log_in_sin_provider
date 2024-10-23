import 'package:flutter/material.dart';
import 'package:log_aplication/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Log in')),
      ),
      body: const _LogIn(),
    );
  }
}

class _LogIn extends StatefulWidget {
  const _LogIn({super.key});

  @override
  State<_LogIn> createState() => _LogInState();
}

class _LogInState extends State<_LogIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el AlertDialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _validateAndNavigate(BuildContext context) {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      _showErrorDialog(context, 'Por favor, ingrese un nombre de usuario y contraseña.');
    } else if (username != password) {
      _showErrorDialog(context, 'Nombre de usuario o contraseña incorrectos.');
    } else {
      context.goNamed(WelcomeScreen.name );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 0.33 * MediaQuery.of(context).size.width,
            height: 0.1 * MediaQuery.of(context).size.height,
            child: _LogInUsername(controller: _usernameController),
          ),
          SizedBox(
            width: 0.33 * MediaQuery.of(context).size.width,
            child: _LogInPassword(controller: _passwordController),
          ),
          const SizedBox(height: 20),
          ValidationButton(onValidate: () => _validateAndNavigate(context)),
        ],
      ),
    );
  }
}

class _LogInUsername extends StatelessWidget {
  final TextEditingController controller;

  const _LogInUsername({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Username/Email',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: colors.primary),
        ),
        filled: true,
      ),
    );
  }
}

class _LogInPassword extends StatelessWidget {
  final TextEditingController controller;

  const _LogInPassword({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      obscureText: true, 
      decoration: InputDecoration(
        hintText: 'Password',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: colors.primary),
        ),
        filled: true,
      ),
    );
  }
}

class ValidationButton extends StatelessWidget {
  final VoidCallback onValidate;

  const ValidationButton({super.key, required this.onValidate});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onValidate,
      child: const Text("VALIDAR"),
    );
  }
}