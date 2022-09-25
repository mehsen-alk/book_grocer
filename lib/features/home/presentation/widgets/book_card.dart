import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/values_manager.dart';
import '../../domain/entities/entities.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p8.h),
      child: Row(
        children: [
          Container(
            width: 100.0,
            height: 150.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(book.thumbnail)),
                color: Colors.amber,
                borderRadius: BorderRadius.circular(AppSize.s12)),
          )
        ],
      ),
    );
  }
}
