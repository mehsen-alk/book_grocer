import 'package:book_grocer/config/color_manager.dart';
import 'package:book_grocer/config/routes_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../../config/assets_manager.dart';
import '../../../../../config/strings_manager.dart';
import '../../../../../config/values_manager.dart';
import '../../../../../core/app/di.dart';
import '../../../data/data_sources/auth_prefs.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({Key? key}) : super(key: key);
  final AuthPreferences _authPreferences = instance<AuthPreferences>();
  List<PageViewModel> _list(BuildContext context) {
    return [
      PageViewModel(
        titleWidget: Text(
          AppStrings.title1,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ).tr(),
        bodyWidget: Text(
          AppStrings.subtitle1,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ).tr(),
        image: SvgPicture.asset(ImageAssets.onboardingLogo1),
      ),
      PageViewModel(
        titleWidget: Text(
          AppStrings.title2,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ).tr(),
        bodyWidget: Text(
          AppStrings.subtitle2,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ).tr(),
        image: SvgPicture.asset(ImageAssets.onboardingLogo2),
      ),
      PageViewModel(
        titleWidget: Text(
          AppStrings.title3,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ).tr(),
        bodyWidget: Text(
          AppStrings.subtitle3,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ).tr(),
        image: SvgPicture.asset(ImageAssets.onboardingLogo3),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: IntroductionScreen(
        pages: _list(context),
        showDoneButton: true,
        done: const Text(AppStrings.done).tr(),
        onDone: () {
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
          _authPreferences.setOnBoardingScreenViewed();
        },
        showNextButton: true,
        next: const Text(AppStrings.next).tr(),
        showSkipButton: true,
        skip: const Text(AppStrings.skip).tr(),
        onSkip: () {
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
          _authPreferences.setOnBoardingScreenViewed();
        },
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: ColorManager.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
