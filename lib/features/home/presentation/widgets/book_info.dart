import 'package:book_grocer/config/color_manager.dart';
import 'package:book_grocer/config/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BookInfo extends StatelessWidget {
  final String bookName;
  final String bookInfo;
  final String image;

  const BookInfo(
      {Key? key,
      required this.bookName,
      required this.bookInfo,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: AppPadding.p20.w,
            left: AppPadding.p20.w,
          ),
          child: Container(
            height: AppSize.s180.h,
            width: AppSize.s120.w,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image)),
                borderRadius: BorderRadius.circular(AppSize.s20.r)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: AppPadding.p8.h,
            bottom: AppPadding.p8.h,
          ),
          child: Text(
            bookName,
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: AppPadding.p8.h,
            bottom: AppPadding.p8.h,
          ),
          child: Text(
            bookInfo,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
class HeadlineBookList extends StatelessWidget {
  final String title;
  const HeadlineBookList({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p8.h).copyWith(left: AppPadding.p20.w),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge,
      ).tr(),
    );
  }
}
class BookInfo1 extends StatelessWidget {
  final String bookName;
  final String bookInfo;
  final String image;

  const BookInfo1(
      {Key? key,
        required this.bookName,
        required this.bookInfo,
        required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: AppPadding.p20.w,
            left: AppPadding.p20.w,
          ),
          child: Container(
            height: AppSize.s200.h,
            width: AppSize.s300.w,
            decoration: BoxDecoration(
              color: ColorManager.darkPrimary,
                image: DecorationImage(image: AssetImage(image)),
                borderRadius: BorderRadius.circular(AppSize.s20.r)),
          ),
        ),
      ],
    );
  }
}

