part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class LoadingCategoryState extends CategoryState{
  @override
  List<Object> get props => [];
}

class ErrorCategoryState extends CategoryState{
  final String errorMessage;
  const ErrorCategoryState({required this.errorMessage});
  @override
  List<Object> get props =>[];
}

class SuccessRomanceBookListState extends CategoryState{
  final List<HomeBookInfo> books;
  const SuccessRomanceBookListState({required this.books});
  @override
  List<Object> get props =>[books];
}
class SuccessMysteryAndDetectiveBookListState extends CategoryState{
  final List<HomeBookInfo> books;
  const SuccessMysteryAndDetectiveBookListState({required this.books});
  @override
  List<Object> get props =>[books];
}
class SuccessHorrorBookListState extends CategoryState{
  final List<HomeBookInfo> books;
  const SuccessHorrorBookListState({required this.books});
  @override
  List<Object> get props =>[books];
}
class SuccessActionAndAdventureBookListState extends CategoryState{
  final List<HomeBookInfo> books;
  const SuccessActionAndAdventureBookListState({required this.books});
  @override
  List<Object> get props =>[books];
}
class SuccessScienceFictionBookListState extends CategoryState{
  final List<HomeBookInfo> books;
  const SuccessScienceFictionBookListState({required this.books});
  @override
  List<Object> get props =>[books];
}
