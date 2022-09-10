import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(const OnBoardingDone()) {
    on<onDone>((event, emit) {
      emit(const OnBoardingDone(done: true));
    });
    on<Skip>((event, emit) {
      emit(const OnBoardingSkip(skip: true));
    });
  }
}
