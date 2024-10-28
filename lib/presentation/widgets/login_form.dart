import 'package:flutter/material.dart';
import 'package:log_aplication/presentation/provider/LogIn_provider.dart';
import 'package:log_aplication/presentation/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:log_aplication/presentation/widgets/login_username.dart';
import 'package:log_aplication/presentation/widgets/login_password.dart';
import 'package:log_aplication/presentation/widgets/validation_button.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _validateAndNavigate(BuildContext context) {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final usuarioProvider = Provider.of<UsuarioProvider>(context, listen: false);

    if (username.isEmpty || password.isEmpty) {
      _showErrorDialog(context, 'Por favor, ingrese un nombre de usuario y contraseña.');
    } else if (usuarioProvider.verificarCredenciales(username, password)) {
      context.goNamed(WelcomeScreen.name);
    } else {
      _showErrorDialog(context, 'Nombre de usuario o contraseña incorrectos.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0), 
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), 
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
             child: Center(
              child: Text('Log in', style: TextStyle(fontSize: 20),), 
             ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 0.8 * MediaQuery.of(context).size.width, 
              child: LogInUsername(controller: _usernameController),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 0.8 * MediaQuery.of(context).size.width,
              child: LogInPassword(controller: _passwordController),
            ),
            const SizedBox(height: 20),
            ValidationButton(onValidate: () => _validateAndNavigate(context)),
          ],
        ),
      ),
    );
  }
}
