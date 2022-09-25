import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BookList extends StatelessWidget {
  final List<Widget> list;
  final double? top;
  final double? bottom;
  final double height;
  const BookList({Key? key, required this.list,required this.height, this.top,this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top?.h??1.h,bottom: bottom?.h??0.h),
      child: SizedBox(
        height: height.h,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: list,
        ),
      ),
    );
  }
}
