part of 'home_bloc.dart';

enum Status { accepted, notAccepted }

class HomeState extends Equatable {
  final Status popularBookListStatus;
  final Status recentBookListStatus;
  final String? popularBookListError;
  final String? recentBookListError;
  final List<HomeBookInfo>? popularBookList;
  final List<HomeBookInfo>? recentBookList;
  final bool popularBookListLoading;
  final bool recentBookListLoading;

  const HomeState({
    this.popularBookList,
    this.recentBookList,
    this.popularBookListStatus = Status.notAccepted,
    this.recentBookListStatus = Status.notAccepted,
    this.popularBookListError,
    this.recentBookListError,
    this.popularBookListLoading = false,
    this.recentBookListLoading = false,
  });

  @override
  List<Object?> get props => [
        popularBookListStatus,
        recentBookListStatus,
        popularBookList,
        recentBookList,
        popularBookListError,
        recentBookListError,
        popularBookListLoading,
        recentBookListLoading,
      ];

  HomeState copyWith({
    Status? popularBookListStatus,
    Status? recentBookListStatus,
    List<HomeBookInfo>? popularBookList,
    List<HomeBookInfo>? recentBookList,
    String? popularBookListError,
    String? recentBookListError,
    bool? popularBookListLoading,
    bool? recentBookListLoading,
  }) {
    return HomeState(
      popularBookListStatus:
          popularBookListStatus ?? this.popularBookListStatus,
      recentBookListStatus: recentBookListStatus ?? this.recentBookListStatus,
      popularBookList: popularBookList ?? this.popularBookList,
      recentBookList: recentBookList ?? this.recentBookList,
      popularBookListError: popularBookListError ?? this.popularBookListError,
      recentBookListError: recentBookListError ?? this.recentBookListError,
      popularBookListLoading:
          popularBookListLoading ?? this.popularBookListLoading,
      recentBookListLoading:
          recentBookListLoading ?? this.recentBookListLoading,
    );
  }
}
