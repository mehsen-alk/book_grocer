import 'package:book_grocer/config/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/app/app_splash_screen.dart';

class Routes {
  static const String onBoardingRoute = '/onBoarding';
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
}

class RouteGenerator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.onBoardingRoute:
      // return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      // case Routes.loginRoute:
      // return MaterialPageRoute(builder: (_) => const LoginView());
      // case Routes.registerRoute:
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
