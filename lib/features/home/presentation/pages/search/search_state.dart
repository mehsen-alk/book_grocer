part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchInProgress extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Book> books;
  
  const SearchSuccess({
    required this.books,
  });

  @override
  List<Object> get props => [books];
}

class SearchFailed extends SearchState {
  final String message;

  const SearchFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
