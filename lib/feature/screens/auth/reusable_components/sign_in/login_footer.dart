import 'package:yell/core/barrel/barrel.dart';
import 'package:flutter/services.dart';

class LoginFooter extends StatelessWidget {
  final VoidCallback onSignUpTap;

  const LoginFooter({super.key, required this.onSignUpTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'AM',
            color: Theme.of(
              context,
            ).textTheme.bodyMedium!.color!.withValues(alpha: 0.7),
          ),
        ),
        GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact(); // Vibration feel
            onSignUpTap();
          },
          child: Container(
            margin: EdgeInsets.zero,
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                fontFamily: 'bold',
                color: isDark ? AMColors.white : AMColors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
