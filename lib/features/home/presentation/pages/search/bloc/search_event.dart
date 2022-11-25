part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchButtonPressed extends SearchEvent {
  final String searchWord;

  const SearchButtonPressed({
    required this.searchWord,
  });

  @override
  List<Object?> get props => [searchWord];
}