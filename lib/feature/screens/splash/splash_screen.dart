import 'package:yell/core/barrel/barrel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AMImages.splash,
                width: size.width * 0.40,
                height: size.width * 0.40,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.08),
                child: const SplashDotsAnimation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
