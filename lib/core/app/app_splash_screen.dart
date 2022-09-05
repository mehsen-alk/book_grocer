import 'dart:async';

import 'package:book_grocer/config/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../config/color_manager.dart';
import '../../config/constants_manager.dart';
import '../../config/routes_manager.dart';
import 'app_prefs.dart';
import 'di.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer =
        Timer(const Duration(milliseconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) {
      if (isUserLoggedIn) {
        // navigate to main screen
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      } else {
        _appPreferences
            .isOnBoardingScreenViewed()
            .then((isOnBoardingScreenViewed) {
          if (isOnBoardingScreenViewed) {
            // navigate to login screen

            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          } else {
            // navigate to on boarding screen

            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
          child: Text(
        AppStrings.appTitle,
        style: Theme.of(context).textTheme.titleLarge,
      ).tr()),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
