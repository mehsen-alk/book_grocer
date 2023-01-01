import 'package:book_grocer/config/values_manager.dart';
import 'package:book_grocer/features/home/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/home_widgets.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({Key? key, required this.book}) : super(key: key);
  final HomeBookInfo book;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(book: book),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: OpacityTween(
                    child: Text(
                      "${book.bookTitle.toUpperCase()} (${book.published.substring(0, 4)})",
                      style: Theme.of(context).textTheme.headlineLarge,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                OpacityTween(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: Text(
                      book.description,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                      maxLines: 200,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                OpacityTween(
                  child: BookInfoTable(book: book),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({Key? key, required this.book}) : super(key: key);
  final HomeBookInfo book;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return SliverAppBar(
      expandedHeight: AppSize.s400.h,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: book.imageLink,
          child: OpacityTween(
            child: BookDetailsCard(image: book.imageLink),
          ),
        ),
      ),
    );
  }
}
