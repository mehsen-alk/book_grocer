part of 'home_bloc.dart';

enum Status { accepted, notAccepted, loading }

class HomeState extends Equatable {
  final Status popularBookListStatus;
  final Status shortStoriesBookListStatus;
  final Status recentBookListStatus;
  final String? popularBookListError;
  final String? shortStoriesBookListError;
  final String? recentBookListError;
  final List<HomeBookInfo>? popularBookList;
  final List<HomeBookInfo>? shortStoriesBookList;
  final List<HomeBookInfo>? recentBookList;

  const HomeState({
    this.popularBookList,
    this.shortStoriesBookList,
    this.recentBookList,
    this.popularBookListStatus = Status.notAccepted,
    this.shortStoriesBookListStatus = Status.notAccepted,
    this.recentBookListStatus = Status.notAccepted,
    this.popularBookListError,
    this.shortStoriesBookListError,
    this.recentBookListError,
  });

  @override
  List<Object?> get props => [
        popularBookListStatus,
        recentBookListStatus,
        popularBookList,
        recentBookList,
        popularBookListError,
        recentBookListError,
        shortStoriesBookListStatus,
        shortStoriesBookList,
        shortStoriesBookListError
      ];

  HomeState copyWith({
    Status? popularBookListStatus,
    Status? recentBookListStatus,
    Status? shortStoriesBookListStatus,
    List<HomeBookInfo>? popularBookList,
    List<HomeBookInfo>? shortStoriesBookList,
    List<HomeBookInfo>? recentBookList,
    String? popularBookListError,
    String? shortStoriesBookListError,
    String? recentBookListError,
  }) {
    return HomeState(
      popularBookListStatus:
          popularBookListStatus ?? this.popularBookListStatus,
      recentBookListStatus: recentBookListStatus ?? this.recentBookListStatus,
      shortStoriesBookListStatus:
          shortStoriesBookListStatus ?? this.shortStoriesBookListStatus,
      popularBookList: popularBookList ?? this.popularBookList,
      shortStoriesBookList: shortStoriesBookList ?? this.shortStoriesBookList,
      recentBookList: recentBookList ?? this.recentBookList,
      popularBookListError: popularBookListError ?? this.popularBookListError,
      recentBookListError: recentBookListError ?? this.recentBookListError,
      shortStoriesBookListError:
          shortStoriesBookListError ?? this.shortStoriesBookListError,
    );
  }
}
