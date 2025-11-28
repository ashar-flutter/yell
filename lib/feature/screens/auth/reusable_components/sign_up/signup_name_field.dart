import 'package:yell/core/barrel/barrel.dart';

class SignUpNameField extends StatelessWidget {
  final TextEditingController controller;

  final FocusNode focusNode;
  final VoidCallback onSubmitted;

  const SignUpNameField({
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
              'Full Name',
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
          hintText: 'Enter your full name',
          prefixIcon: Icon(Icons.person_outline_rounded, size: 20),
          isPassword: false,
          focusNode: focusNode,
          onSubmitted: onSubmitted,
        ),
      ],
    );
  }
}