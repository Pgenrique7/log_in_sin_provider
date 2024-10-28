import 'package:flutter/material.dart';

class LogInUsername extends StatelessWidget {
  final TextEditingController controller;

  const LogInUsername({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Username/Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        filled: true,
      ),
    );
  }
}
