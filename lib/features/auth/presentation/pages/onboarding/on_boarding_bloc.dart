import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_grocer/config/assets_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../../config/strings_manager.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

final List<PageViewModel> list = [
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

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingInitial(list)) {
    on<OnDone>((event, emit) {});
    on<Skip>((event, emit) {});
  }
}
