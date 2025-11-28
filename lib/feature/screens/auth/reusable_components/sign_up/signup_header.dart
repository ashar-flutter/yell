import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.15),
        Text(
          'Create Account!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            fontFamily: 'bold',
            color: Theme.of(context).textTheme.headlineLarge!.color,
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          'Sign up to get started',
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