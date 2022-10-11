import 'package:bloc/bloc.dart';
import 'package:book_grocer/core/app/di.dart';
import 'package:book_grocer/features/home/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/repository/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository = instance<HomeRepository>();

  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>(
      (event, emit) async {
        if (event is GetBookLists) {
          emit(state.copyWith(
            popularBookListStatus: Status.loading,
            recentBookListStatus: Status.loading,
            shortStoriesBookListStatus: Status.loading,
          ));
          final popularBookResponse =
              await _homeRepository.getPopularBookList();
          popularBookResponse.fold(
            (failure) => emit(state.copyWith(
              popularBookListError: failure.message,
              popularBookListStatus: Status.notAccepted,
            )),
            (bookList) {
              emit(state.copyWith(
                popularBookList: bookList,
                popularBookListStatus: Status.accepted,
              ));
            },
          );

          final shortStoriesBookListResponse =
              await _homeRepository.getRecentBookList();
          shortStoriesBookListResponse.fold(
            (failure) => emit(state.copyWith(
              shortStoriesBookListError: failure.message,
              shortStoriesBookListStatus: Status.notAccepted,
            )),
            (bookList) {
              emit(state.copyWith(
                shortStoriesBookList: bookList,
                shortStoriesBookListStatus: Status.accepted,
              ));
            },
          );
          final recentBookListResponse =
              await _homeRepository.getRecentBookList();
          recentBookListResponse.fold(
            (failure) => emit(state.copyWith(
              recentBookListError: failure.message,
              recentBookListStatus: Status.notAccepted,
            )),
            (bookList) {
              emit(state.copyWith(
                recentBookList: bookList,
                recentBookListStatus: Status.accepted,
              ));
            },
          );
        }
      },
    );
  }
}
