import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      body: Column(
        children: [
          Image.asset(
            'assets/images/nike_logo.png',
            color: Colors.white,
            width: 120,
          ),
        ],
      ),
    );
  }
}
