import 'package:book_grocer/core/app/di.dart';
import 'package:book_grocer/features/auth/presentation/pages/onboarding/on_boarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../../config/strings_manager.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({Key? key}) : super(key: key);
  final OnBoardingBloc _onBoardingBloc = instance<OnBoardingBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoardingBloc, OnBoardingState>(
        bloc: _onBoardingBloc,
        builder: (context, state) {
          return IntroductionScreen(
            pages: list,
            showDoneButton: true,
            done: const Text(AppStrings.done),
            onDone: ()=>print(''),
            showNextButton: true,
            next: const Text(AppStrings.next),
            showSkipButton: true,
            skip: const Text(AppStrings.skip),
            onSkip: ()=>print(''),
          );
        },
      ),
    );
  }
}
