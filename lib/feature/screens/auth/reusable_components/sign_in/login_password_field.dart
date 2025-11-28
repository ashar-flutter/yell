import 'package:yell/core/barrel/barrel.dart';

class LoginPasswordField extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  const LoginPasswordField({
    super.key,
    required this.focusNode,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        SizedBox(height: size.height * 0.025),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'bold',
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.015),
        AMTextField(
          controller: controller,
          hintText: 'Enter your password...',
          prefixIcon: Icon(Icons.lock_outline_rounded, size: 20),
          isPassword: true,
          focusNode: focusNode,
        ),
        SizedBox(height: size.height * 0.02),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                'forget Password?',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'bold',
                  fontWeight: FontWeight.w500,
                  color: isDark ? AMColors.white : AMColors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}