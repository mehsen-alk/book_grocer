import 'package:bloc/bloc.dart';
import 'package:book_grocer/core/app/di.dart';
import 'package:book_grocer/features/home/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repository/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository = instance<HomeRepository>();

  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>(
      (event, emit) async {
        if (event is GetBooksLists) {
          emit(state.copyWith(
            popularBookListStatus: Status.loading,
            shortStoriesBookListStatus: Status.loading,
            recentBookListStatus: Status.loading,
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
        } else if (event is GetPopularBookList) {
          emit(state.copyWith(popularBookListStatus: Status.loading));
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
        } else if (event is GetRecentBookList) {
          emit(state.copyWith(recentBookListStatus: Status.loading));
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
        } else if (event is GetShortStoriesBookList) {
          emit(state.copyWith(shortStoriesBookListStatus: Status.loading));

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
        }
      },
    );
  }
}
