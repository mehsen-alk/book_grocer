import 'package:book_grocer/config/color_manager.dart';
import 'package:book_grocer/config/strings_manager.dart';
import 'package:book_grocer/features/home/presentation/widgets/book_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../config/values_manager.dart';
import '../../domain/entities/entities.dart';
import '../pages/home/bloc/home_bloc.dart';

class BookList extends StatelessWidget {
  final List<HomeBookInfo> books;
  final double? top;

  const BookList({Key? key, required this.books, this.top}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top?.h ?? 1.h),
      child: SizedBox(
        height: AppSize.s280.h,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (_, index) {
              return BookInfo(book: books[index]);
            }),
      ),
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
        if (state.popularBookListLoading == false) {
          return HomeLoadingView(topPadding: AppPadding.p280.h);
        } else if (state.popularBookListLoading == true &&
            state.popularBookListStatus == Status.notAccepted) {
          return HomeErrorView(
            errorMessage: state.popularBookListError ?? 'Empty',
            tryAgainFunction: () {},
            topPadding: AppPadding.p280.h,
          );
        } else if (state.popularBookListLoading == true &&
            state.popularBookListStatus == Status.accepted) {
          return BookList(
            books: state.popularBookList ?? [],
            top: topPadding,
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
        if (state.recentBookListLoading == false) {
          return HomeLoadingView(topPadding: AppPadding.p0.h);
        } else if (state.recentBookListLoading == true &&
            state.recentBookListStatus == Status.notAccepted) {
          return HomeErrorView(
            errorMessage: state.recentBookListError ?? 'Empty',
            tryAgainFunction: () {},
            topPadding: AppPadding.p60.h,
          );
        } else if (state.recentBookListLoading == true &&
            state.recentBookListStatus == Status.accepted) {
          return BookList(
            books: state.recentBookList ?? [],
            top: topPadding,
          );
        }
        return Container();
      },
    );
  }
}

class HomeErrorView extends StatelessWidget {
  final String errorMessage;
  final Function tryAgainFunction;
  final double topPadding;

  const HomeErrorView(
      {Key? key,
      required this.errorMessage,
      required this.tryAgainFunction,
      required this.topPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Column(
          children: [
            Text(
              errorMessage.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: () => tryAgainFunction(),
              style: Theme.of(context).textButtonTheme.style,
              child: Text(AppStrings.tryAgain.tr()),
            )
          ],
        ),
      ),
    );
  }
}

class HomeLoadingView extends StatelessWidget {
  final double topPadding;

  const HomeLoadingView({
    required this.topPadding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p20.h).copyWith(top: topPadding),
        child: SpinKitFoldingCube(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
                decoration: BoxDecoration(color: ColorManager.primary));
          },
          size: AppSize.s70.sp,
        ),
      ),
    );
  }
}
