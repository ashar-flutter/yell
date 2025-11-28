import '../../../../core/barrel/barrel.dart';

class OnboardThree extends StatelessWidget {
  const OnboardThree({super.key});

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
                  AMImages.onboarding3,
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Text(
              AMText.onboardTitle3,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "bold",
                decoration: TextDecoration.none,
                color: Theme.of(context).textTheme.headlineSmall!.color,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            AMGap.h10,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Every professional is verified, top-rated, and quality-tested.",
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
                "Your comfort, safety, and satisfaction come first.",
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
