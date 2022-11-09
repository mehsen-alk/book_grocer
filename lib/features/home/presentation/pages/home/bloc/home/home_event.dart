part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetBooksLists extends HomeEvent {}
class GetPopularBookList extends HomeEvent {}
class GetShortStoriesBookList extends HomeEvent {}
class GetRecentBookList extends HomeEvent {}

class GetBookDetails extends HomeEvent {
  final HomeBookInfo book;

  const GetBookDetails({required this.book});
  @override
  List<Object> get props => [book];
}
