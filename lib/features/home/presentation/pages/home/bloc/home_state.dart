part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMessage;
  const HomeErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class HomeSuccessState extends HomeState {
  final List<HomeBookInfo> books;
  const HomeSuccessState({
    required this.books,
  });
  @override
  List<Object> get props => [books];
}
