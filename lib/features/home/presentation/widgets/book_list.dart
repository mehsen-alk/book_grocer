import 'package:book_grocer/config/strings_manager.dart';
import 'package:book_grocer/features/home/presentation/widgets/book_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/values_manager.dart';
import '../../domain/entities/entities.dart';
import '../pages/home/bloc/home_bloc.dart';

class BookList extends StatelessWidget {
  final List<HomeBookInfo> books;
  final double? top;
  final double? bottom;
  final double height;

  const BookList(
      {Key? key,
      required this.books,
      required this.height,
      this.top,
      this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top?.h ?? 1.h, bottom: bottom?.h ?? 0.h),
      child: SizedBox(
        height: height,
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

class BookListContent extends StatelessWidget {
  const BookListContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoadingState) {
        return const HomeLoadingView();
      } else if (state is HomeErrorState) {
        return HomeErrorView(
          errorMessage: state.errorMessage,
          tryAgainFunction: () => HomeBloc().add(GetTheBookList()),
        );
      } else if (state is HomeSuccessState) {
        return BookList(
          books: state.books,
          height: AppSize.s260.h,
          top: AppPadding.p80.h,
        );
      }
      return Container();
    });
  }
}

class HomeErrorView extends StatelessWidget {
  final String errorMessage;
  final Function tryAgainFunction;

  const HomeErrorView({
    Key? key,
    required this.errorMessage,
    required this.tryAgainFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: AppPadding.p250.h),
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
  const HomeLoadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: AppPadding.p250.h),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
