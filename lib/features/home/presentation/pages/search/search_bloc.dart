import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/app/di.dart';
import '../../../data/models/requests.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/repository/search_repository.dart';


part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _repository = instance<SearchRepository>();

  SearchBloc(
  ) : super(SearchInitial()) {
    on<SearchButtonPressed>((event, emit) async {
      emit(SearchInProgress());
      (await _repository.searchForBook(
              SearchFooBookRequest(searchWord: event.searchWord)))
          .fold((failure) {
        emit(SearchFailed(message: failure.message));
      }, (books) {
        emit(SearchSuccess(books: books));
      });
    });
  }
}
