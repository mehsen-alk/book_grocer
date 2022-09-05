part of 'on_boarding_bloc.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();
}

class OnBoardingInitial extends OnBoardingState {
  final List<PageViewModel>? list;
  const OnBoardingInitial({this.list});

  OnBoardingInitial copyWith({List<PageViewModel>? list}){
    return OnBoardingInitial(list: list);
  }
  @override
  List<Object?> get props => [list];
}
