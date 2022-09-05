import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../../config/strings_manager.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(const OnBoardingInitial()) {
    on<GoNext>((event, emit) {});
    on<Skip>((event, emit) {});
  }

  PageViewModel pageViewModel(String title, String body, SvgPicture image) {
    return PageViewModel(title: title, body: body, image: image);
  }

  List<PageViewModel> getPageData() => [];
}
