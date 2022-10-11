import 'package:book_grocer/config/values_manager.dart';
import 'package:book_grocer/features/home/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/home_widgets.dart';

class BookDetails extends StatelessWidget {
  final HomeBookInfo book;

  const BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final w = constraints.maxWidth;
      final h = constraints.maxHeight;
      return Scaffold(
        body: SizedBox(
          height: h.h,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: h * -.09,
                width: w,
                height: h * .6,
                child: Hero(
                  tag: book.imageLink,
                  child: OpacityTween(
                    child: BookDetailsCard(image: book.imageLink),
                  ),
                ),
              ),
              Positioned(
                height: h * .5,
                width: w,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30.0,
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
                      const SizedBox(
                        height: 20.0,
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
                      const SizedBox(
                        height: 30.0,
                      ),
                      OpacityTween(
                        child: BookInfoTable(
                          book: book,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
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
