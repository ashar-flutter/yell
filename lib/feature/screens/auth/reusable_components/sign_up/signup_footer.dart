import 'package:yell/core/barrel/barrel.dart';
import 'package:flutter/services.dart';

class SignUpFooter extends StatelessWidget {
  final VoidCallback onSignInTap;

  const SignUpFooter({super.key, required this.onSignInTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'already have an account?  ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'AM',
              color: Theme.of(
                context,
              ).textTheme.bodyMedium!.color!.withValues(alpha: 0.7),
            ),
          ),
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              onSignInTap();
            },
            child: Container(
              margin: EdgeInsets.zero,
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'bold',
                  color: isDark ? AMColors.white : AMColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
