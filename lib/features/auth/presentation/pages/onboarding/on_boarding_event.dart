part of 'on_boarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();
}

class onDone extends OnBoardingEvent {
  @override
  List<Object?> get props => [];
}

class Skip extends OnBoardingEvent {
  @override
  List<Object?> get props => [];
}
