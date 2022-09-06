part of 'on_boarding_bloc.dart';

abstract class OnBoardingState extends Equatable {
  final List<PageViewModel>? list;

  const OnBoardingState({this.list});
}

class OnBoardingInitial extends OnBoardingState {
  const OnBoardingInitial(List<PageViewModel>? list) : super(list: list);

  @override
  List<Object?> get props => [];
}
