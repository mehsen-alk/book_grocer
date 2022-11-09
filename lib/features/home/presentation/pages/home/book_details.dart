import 'package:book_grocer/config/values_manager.dart';
import 'package:book_grocer/features/home/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/home_widgets.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({Key? key, required this.book}) : super(key: key);
  final HomeBookInfo book;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final w = constraints.maxWidth.w;
      final h = constraints.maxHeight.h;
      return Scaffold(
        body: SizedBox(
          height: h.h,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: h * -.1.h,
                width: w.w,
                height: h * .5.h,
                child: Hero(
                  tag: book.imageLink,
                  child: OpacityTween(
                    child: BookDetailsCard(image: book.imageLink),
                  ),
                ),
              ),
              Positioned(
                height: h * .38.h,
                width: w.w,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppSize.s30.h,
                      ),
                      OpacityTween(
                        child: Hero(
                          tag: book.bookTitle,
                          child: Material(
                            type: MaterialType.transparency,
                            child: Text(
                              "${book.bookTitle.toUpperCase()} (${book.published.substring(0, 4)})",
                              style: Theme.of(context).textTheme.headlineLarge,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppSize.s20.h,
                      ),
                      OpacityTween(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p20.w),
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
                        height: AppSize.s30.h,
                      ),
                      OpacityTween(
                        child: BookInfoTable(book:book),
                      ),
                      SizedBox(
                        height: AppSize.s20.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
