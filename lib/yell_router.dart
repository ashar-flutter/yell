import 'package:yell/core/barrel/barrel.dart';

class YellRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AMRoutes.splash:
        return _buildRoute(const SplashScreen());
      case AMRoutes.main:
        return _buildRoute(const MainPage());
      case AMRoutes.login:
        return _buildRoute(const LoginPage());
      case AMRoutes.signUp:
        return _buildRoute(const SignUpPage());

      default:
        return _buildRoute(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static PageRouteBuilder _buildRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
      transitionDuration: Duration.zero,
    );
  }
}
