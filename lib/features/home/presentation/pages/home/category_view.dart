import 'package:book_grocer/config/color_manager.dart';
import 'package:book_grocer/config/strings_manager.dart';
import 'package:book_grocer/features/home/presentation/pages/home/bloc/category/category_bloc.dart';
import 'package:book_grocer/features/home/presentation/widgets/home_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/values_manager.dart';
import '../../widgets/home_widgets.dart';
import 'bloc/category/category_bloc.dart';

class CategoryView extends StatelessWidget {
  final CategoryEvent event;

  const CategoryView({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryBloc>(
      create: (context) => CategoryBloc()..add(event),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light),
          backgroundColor: ColorManager.primary,
          title: Text(
            AppStrings.appTitle,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: ColorManager.white),
          ).tr(),
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is LoadingCategoryState) {
              return HomeLoadingView(topPadding: AppPadding.p35.h);
            } else if (state is ErrorCategoryState) {
              return HomeErrorView(
                errorMessage: state.errorMessage,
                tryAgainFunction: () {},
                topPadding: AppPadding.p300.h,
              );
            } else if (state is SuccessScienceFictionBookListState) {
              return CategoryBookList(books: state.books);
            }
            else if (state is SuccessHorrorBookListState) {
              return CategoryBookList(books: state.books);
            }
            else if (state is SuccessMysteryAndDetectiveBookListState) {
              return CategoryBookList(books: state.books);
            }
            else if (state is SuccessActionAndAdventureBookListState) {
              return CategoryBookList(books: state.books);
            }
            else if (state is SuccessRomanceBookListState) {
              return CategoryBookList(books: state.books);
            }
            return Container();
          },
        ),
      ),
    );
  }
}