import 'package:yell/core/barrel/barrel.dart';

class YellRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AMRoutes.splash:
        return _crossFadeRoute(const SplashScreen());

      case AMRoutes.main:
        return _crossFadeRoute(const MainPage());

      case AMRoutes.login:
        return _crossFadeRoute(const LoginPage());

      case AMRoutes.signUp:
        return _crossFadeRoute(const SignUpPage());

      default:
        return _crossFadeRoute(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  /// PERFECT CROSS-FADE (old fades out + new fades in)
  static PageRouteBuilder _crossFadeRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 350),
      reverseTransitionDuration: const Duration(milliseconds: 350),
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) => page,

      transitionsBuilder: (context, animation, secondaryAnimation, child) {

        final fadeIn = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );


        final fadeOut = CurvedAnimation(
          parent: secondaryAnimation,
          curve: Curves.easeOut,
        );

        return FadeTransition(
          opacity: fadeIn,         // new screen fade in
          child: FadeTransition(
            opacity: ReverseAnimation(fadeOut), // old screen fade out
            child: child,
          ),
        );
      },
    );
  }
}
