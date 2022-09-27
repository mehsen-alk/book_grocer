import 'package:bloc/bloc.dart';
import 'package:book_grocer/core/app/di.dart';
import 'package:book_grocer/features/home/data/repository/home_repository_impl.dart';
import 'package:book_grocer/features/home/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository = instance<HomeRepositoryImpl>();
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetTheBookList) {
        emit(HomeLoadingState());
        final books = await _homeRepository.getBookList();
        books.fold(
          (failure) => emit(HomeErrorState(errorMessage: failure.message)),
          (bookList) => emit(HomeSuccessState(books: bookList)),
        );
      }
    });
  }
}
