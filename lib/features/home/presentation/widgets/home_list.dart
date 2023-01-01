import 'package:book_grocer/config/app_localizations.dart';
import 'package:book_grocer/config/strings_manager.dart';
import 'package:book_grocer/core/app/constants.dart';
import 'package:book_grocer/features/home/presentation/pages/book_details.dart';
import 'package:book_grocer/features/home/presentation/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/values_manager.dart';
import '../../domain/entities/entities.dart';
import '../pages/home/bloc/home_bloc.dart';

class BookList extends StatelessWidget {
  final List<HomeBookInfo> books;
  final double? top;
  final double height;
  final Axis axis;

  const BookList(
      {Key? key,
      required this.books,
      this.top,
      required this.height,
      required this.axis,
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void pushBookDetails(HomeBookInfo book) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BookDetails(book: book),
          ));
    }

    return Padding(
      padding: EdgeInsets.only(top: top?.h ?? 1.h),
      child: SizedBox(
        height: height,
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: axis,
            itemCount: books.length,
            itemBuilder: (_, index) {
              return BookInfo(
                book: books[index],
                onTap: () {
                  pushBookDetails(books[index]);
                },
              );
            }),
      ),
    );
  }
}

class CategoryBookList extends StatelessWidget {
  const CategoryBookList({Key? key, required this.books}) : super(key: key);
  final List<HomeBookInfo> books;

  @override
  Widget build(BuildContext context) {
    void pushBookDetails(HomeBookInfo book) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BookDetails(book: book),
          ));
    }

    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p20.h),
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.52.h),
      itemCount: books.length,
      itemBuilder: (_, index) {
        return BookInfo(
            book: books[index],
            onTap: () {
              pushBookDetails(books[index]);
            });
      },
    );
  }
}

class PopularBookListContent extends StatelessWidget {
  final double topPadding;

  const PopularBookListContent({
    Key? key,
    required this.topPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.popularBookListStatus == Status.loading) {
          return HomeLoadingView(topPadding: AppPadding.p320.h);
        } else if (state.popularBookListStatus == Status.notAccepted) {
          return HomeErrorView(
            errorMessage: state.popularBookListError ?? AppStrings.undefined.tr(context),
            tryAgainFunction: () {
              BlocProvider.of<HomeBloc>(context).add(GetPopularBookList());
            },
            topPadding: AppPadding.p310.h,
          );
        } else if (state.popularBookListStatus == Status.accepted) {
          return BookList(
            books: state.popularBookList ?? [],
            top: topPadding,
            height: AppSize.s260.h,
            axis: Axis.horizontal,
          );
        }
        return Container();
      },
    );
  }
}

class RecentBookListContent extends StatelessWidget {
  final double topPadding;

  const RecentBookListContent({
    Key? key,
    required this.topPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.recentBookListStatus == Status.loading) {
          return HomeLoadingView(topPadding: AppPadding.p35.h);
        } else if (state.recentBookListStatus == Status.notAccepted) {
          return HomeErrorView(
            errorMessage: state.recentBookListError ?? AppStrings.undefined.tr(context),
            tryAgainFunction: () {
              BlocProvider.of<HomeBloc>(context).add(GetRecentBookList());
            },
            topPadding: AppPadding.p20.h,
          );
        } else if (state.recentBookListStatus == Status.accepted) {
          return BookList(
            books: state.recentBookList ?? [],
            top: topPadding,
            height: AppSize.s260.h,
            axis: Axis.horizontal,
          );
        }
        return Container();
      },
    );
  }
}

class ShortStoriesBookListContent extends StatelessWidget {
  final double topPadding;

  const ShortStoriesBookListContent({
    Key? key,
    required this.topPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.shortStoriesBookListStatus == Status.loading) {
          return HomeLoadingView(topPadding: AppPadding.p35.h);
        } else if (state.shortStoriesBookListStatus == Status.notAccepted) {
          return HomeErrorView(
            errorMessage:
                state.shortStoriesBookListError ?? AppStrings.undefined.tr(context),
            tryAgainFunction: () {
              BlocProvider.of<HomeBloc>(context).add(GetShortStoriesBookList());
            },
            topPadding: AppPadding.p20.h,
          );
        } else if (state.shortStoriesBookListStatus == Status.accepted) {
          return BookList(
            books: state.shortStoriesBookList ?? [],
            top: topPadding,
            height: AppSize.s260.h,
            axis: Axis.horizontal,
          );
        }
        return Container();
      },
    );
  }
}

class BookGenresInfoList extends StatelessWidget {
  const BookGenresInfoList({Key? key, required this.verticalPadding})
      : super(key: key);
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s265.h,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: Constants.bookGenresInfoList.length,
          itemBuilder: (_, index) => Constants.bookGenresInfoList[index],
        ),
      ),
    );
  }
}
