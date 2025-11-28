import 'package:yell/core/barrel/barrel.dart';

class LoginEmailField extends StatelessWidget {
  final TextEditingController controller;

  final FocusNode focusNode;
  final VoidCallback onSubmitted;

  const LoginEmailField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Email',
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
          hintText: 'Enter your email...',
          prefixIcon: Icon(Icons.alternate_email_rounded, size: 20),
          isPassword: false,
          focusNode: focusNode,
          onSubmitted: onSubmitted,
        ),
      ],
    );
  }
}
