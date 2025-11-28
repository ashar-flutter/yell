import 'package:yell/core/barrel/barrel.dart';

class SplashDotsAnimation extends StatefulWidget {
  const SplashDotsAnimation({super.key});

  @override
  State<SplashDotsAnimation> createState() => _SplashDotsAnimationState();
}

class _SplashDotsAnimationState extends State<SplashDotsAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.3, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(int index) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: AMColors.royalBlue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, _buildDot),
    );
  }
}
