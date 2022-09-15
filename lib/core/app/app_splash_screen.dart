import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../config/assets_manager.dart';
import '../../config/color_manager.dart';
import '../../config/constants_manager.dart';
import '../../config/routes_manager.dart';
import '../../features/auth/data/data_sources/auth_prefs.dart';
import 'di.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AuthPreferences _authPreferences = instance<AuthPreferences>();

  _startDelay() {
    _timer =
        Timer(const Duration(milliseconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() async {
    {
      if (_authPreferences.isUserLoggedIn()) {
        // navigate to main screen
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      } else {
        {
          if (_authPreferences.isOnBoardingScreenViewed()) {
            // navigate to login screen
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          } else {
            // navigate to on boarding screen
            //TODO: don't forget  when you push put onBoardingRoute
            // TODO: after finish _authPreferences.setOnBoardingScreenViewed();
            _authPreferences.setOnBoardingScreenViewed();
            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
          }
        }
      }
    }
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
        child: Lottie.asset(JsonAssets.splashLogo),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
