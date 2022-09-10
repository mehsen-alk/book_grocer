import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../../config/assets_manager.dart';
import '../../../../../config/strings_manager.dart';
import 'on_boarding_bloc.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({Key? key}) : super(key: key);
  final OnBoardingBloc _onBoardingBloc = OnBoardingBloc();
  final List<PageViewModel> _list = [
    PageViewModel(
        title: AppStrings.title1,
        body: AppStrings.subtitle1,
        image: SvgPicture.asset(ImageAssets.onboardingLogo1)),
    PageViewModel(
        title: AppStrings.title2,
        body: AppStrings.subtitle2,
        image: SvgPicture.asset(ImageAssets.onboardingLogo2)),
    PageViewModel(
        title: AppStrings.title3,
        body: AppStrings.subtitle3,
        image: SvgPicture.asset(ImageAssets.onboardingLogo3)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnBoardingBloc, OnBoardingState>(
          bloc: _onBoardingBloc,
          listener: (context, state) {},
          builder: (context, state) {
            return IntroductionScreen(
              pages: _list,
              showDoneButton: true,
              done: Text(AppStrings.done.tr()),
              onDone: () {
                _onBoardingBloc.add(onDone());
              },
              showNextButton: true,
              next: Text(AppStrings.next.tr()),
              showSkipButton: true,
              skip: Text(AppStrings.skip.tr()),
              onSkip: () {
                _onBoardingBloc.add(Skip());
              },
            );
          }),
    );
  }
}
