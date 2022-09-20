import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/app/app_splash_screen.dart';
import '../core/app/di.dart';
import '../features/auth/presentation/pages/login/login_view.dart';
import '../features/auth/presentation/pages/onboarding/onboarding_view.dart';
import '../features/auth/presentation/pages/register/register_view.dart';
import '../features/auth/presentation/pages/reset_password/reset_password_view.dart';
import '../features/home/presentation/main_view.dart';
import 'strings_manager.dart';

class Routes {
  static const String onBoardingRoute = '/onBoarding';
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String resetPassword = '/resetPassword';

  static const String mainRoute = '/home';
}

class RouteGenerator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initAuthenticationModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => ResetPasswordView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ).tr(),
        ),
        body: Center(
          child: const Text(AppStrings.noRouteFound).tr(),
        ),
      ),
    );
  }
}
