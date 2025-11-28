import '../../../../core/barrel/barrel.dart';

class OnboardOne extends StatelessWidget {
  const OnboardOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppBar().preferredSize.height * 1.2),

            Center(
              child: OnboardingAnimation(
                child: Image.asset(
                  AMImages.onboarding1,
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Text(
              AMText.onboardTitle1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "bold",
                decoration: TextDecoration.none,
                color: Theme.of(context).textTheme.headlineSmall!.color,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            AMGap.h5,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "From certified plumbers to expert cleaners — access reliable, fast, and",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "AM",
                  decoration: TextDecoration.none,
                  color: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.color!.withValues(alpha: 0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "high-quality services anytime with just a tap.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "AM",
                  decoration: TextDecoration.none,
                  color: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.color!.withValues(alpha: 0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            AMGap.h20,
          ],
        ),
      ),
    );
  }
}
