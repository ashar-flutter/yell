import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.15),
        Text(
          'Welcome to Yell!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            fontFamily: 'bold',
            color: Theme.of(context).textTheme.headlineLarge!.color,
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          'Sign in to continue',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'AM',
            color: Theme.of(context).textTheme.bodyMedium!.color!.withValues(alpha: 0.7),
          ),
        ),
        SizedBox(height: size.height * 0.03),
      ],
    );
  }
}