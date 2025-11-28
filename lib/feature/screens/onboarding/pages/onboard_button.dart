import 'package:yell/core/barrel/barrel.dart';

class OnboardButton extends StatelessWidget {
  final PageController pageController;
  final int currentIndex;
  final VoidCallback onLastPage;

  const OnboardButton({
    super.key,
    required this.pageController,
    required this.currentIndex,
    required this.onLastPage,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
    margin: EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [AMColors.cobaltBlue, AMColors.royalBlue, AMColors.steelBlue]
              : [AMColors.navyBlue, AMColors.royalBlue, AMColors.skyBlue],
          stops: const [0.0, 0.5, 1.0],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AMColors.cobaltBlue.withValues(alpha: 0.4)
                : AMColors.royalBlue.withValues(alpha: 0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (currentIndex == 2) {
              onLastPage();
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              currentIndex == 2 ? "Get Started" : "Next",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "bold",
                fontWeight: FontWeight.w800,
                color: AMColors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}