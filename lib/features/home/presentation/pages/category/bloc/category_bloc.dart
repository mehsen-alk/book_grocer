import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/app/di.dart';
import '../../../../../../core/data/failure.dart';
import '../../../../domain/entities/entities.dart';
import '../../../../domain/repository/home_repository.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final HomeRepository _homeRepository = instance<HomeRepository>();

  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      emit(LoadingCategoryState());
      if (event is GetRomanceBookList) {
        final romanceBookResponse = await _homeRepository.getRomanceBookList();
        emit(categoryFold(romanceBookResponse, GetRomanceBookList()));
      } else if (event is GetMysteryAndDetectiveBookList) {
        final mysteryAndDetectiveBookResponse =
            await _homeRepository.getMysteryAndDetectiveBookList();
        emit(categoryFold(
            mysteryAndDetectiveBookResponse, GetMysteryAndDetectiveBookList()));
      } else if (event is GetScienceFictionBookList) {
        final scienceFictionBookResponse =
            await _homeRepository.getScienceFictionBookList();
        emit(categoryFold(
            scienceFictionBookResponse, GetScienceFictionBookList()));
      } else if (event is GetHorrorBookList) {
        final horrorBookResponse = await _homeRepository.getHorrorBookList();
        emit(categoryFold(horrorBookResponse, GetHorrorBookList()));
      } else if (event is GetActionAndAdventureBookList) {
        final actionAndAdventureBookResponse =
            await _homeRepository.getActionAndAdventureBookList();
        emit(categoryFold(
            actionAndAdventureBookResponse, GetActionAndAdventureBookList()));
      }
    });
  }

  CategoryState categoryFold(
      Either<Failure, List<HomeBookInfo>> response, CategoryEvent event) {
    return response.fold((failure) {
      return ErrorCategoryState(errorMessage: failure.message);
    }, (bookList) {
      switch (event.runtimeType) {
        case GetRomanceBookList:
          return SuccessRomanceBookListState(books: bookList);
        case GetActionAndAdventureBookList:
          return SuccessActionAndAdventureBookListState(books: bookList);
        case GetHorrorBookList:
          return SuccessHorrorBookListState(books: bookList);
        case GetMysteryAndDetectiveBookList:
          return SuccessMysteryAndDetectiveBookListState(books: bookList);
        case GetScienceFictionBookList:
          return SuccessScienceFictionBookListState(books: bookList);
        default:
          return CategoryInitial();
      }
    });
  }
}
