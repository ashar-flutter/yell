import 'package:yell/core/barrel/barrel.dart';

class AMAuthButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const AMAuthButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  State<AMAuthButton> createState() => _AMAuthButtonState();
}

class _AMAuthButtonState extends State<AMAuthButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.96,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward();
    widget.onPressed?.call();
    Future.delayed(const Duration(milliseconds: 100), () {
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [
                        AMColors.navyBlue,
                        AMColors.royalBlue,
                        AMColors.cobaltBlue,
                      ]
                    : [AMColors.royalBlue, AMColors.skyBlue, AMColors.cyan],
                stops: const [0.0, 0.6, 1.0],
              ),
              borderRadius: BorderRadius.circular(16),boxShadow: [
              BoxShadow(
                color: isDark
                    ? AMColors.navyBlue.withValues(alpha: 0.3)
                    : AMColors.royalBlue.withValues(alpha: 0.3),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
            ),
            child: GestureDetector(
              onTap: _handleTap,
              child: Container(
                alignment: Alignment.center,
                child: widget.isLoading
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AMColors.white,
                          ),
                        ),
                      )
                    : Text(
                        widget.text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'bold',
                          fontWeight: FontWeight.w800,
                          color: AMColors.white,
                          letterSpacing: 0.8,
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
