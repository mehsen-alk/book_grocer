import 'package:book_grocer/config/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String onBoarding = '/onBoarding';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
}

class RouteGenerator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
      // return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.splash:
      // return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.login:
      // return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.register:
      // return MaterialPageRoute(builder: (_) => const RegisterView());
      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound).tr(),
        ),
        body: Center(
          child: const Text(AppStrings.noRouteFound).tr(),
        ),
      ),
    );
  }
}
