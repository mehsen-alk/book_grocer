part of 'on_boarding_bloc.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();
}

class OnBoardingDone extends OnBoardingState {
  final bool done;

  const OnBoardingDone({this.done = false});

  @override
  List<Object?> get props => [done];
}

class OnBoardingSkip extends OnBoardingState {
  final bool skip;

  const OnBoardingSkip({this.skip = false});

  @override
  List<Object?> get props => [skip];
}
