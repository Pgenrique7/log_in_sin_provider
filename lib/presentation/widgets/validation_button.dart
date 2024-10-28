import 'package:flutter/material.dart';

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
