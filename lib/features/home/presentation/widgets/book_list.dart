import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/values_manager.dart';
import 'book_info.dart';

class BookList extends StatelessWidget {
  final List<HomeInfo> list;
  final double padding;
  const BookList({Key? key,required this.list,required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: SizedBox(
        height: AppSize.s240.sp,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: list,
        ),
      ),
    );
  }
}
