import 'package:yell/core/barrel/barrel.dart';

class AMTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final bool isPassword;
  final FocusNode? focusNode;
  final VoidCallback? onSubmitted;

  const AMTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.focusNode,
    this.onSubmitted,
  });

  @override
  State<AMTextField> createState() => _AMTextFieldState();
}

class _AMTextFieldState extends State<AMTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.3)
                : Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        textInputAction: widget.isPassword
            ? TextInputAction.done
            : TextInputAction.next,
        onEditingComplete:
            widget.onSubmitted ?? () => FocusScope.of(context).unfocus(),
        obscureText: widget.isPassword ? _obscureText : false,
        style: TextStyle(
          fontFamily: "AM",
          fontSize: 14,
          color: Theme.of(context).textTheme.bodyLarge!.color,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3,
        ),
        cursorColor: isDark ? AMColors.white : Colors.black,
        decoration: InputDecoration(
          filled: true,
          fillColor: isDark ? Color(0xFF1A1A1A) : Colors.grey.shade50,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Theme.of(
              context,
            ).textTheme.bodyMedium!.color!.withValues(alpha: 0.6),
            fontSize: 13,
            fontFamily: "AM",
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
                    size: 20,
                    _obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: isDark ? Colors.white : Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
