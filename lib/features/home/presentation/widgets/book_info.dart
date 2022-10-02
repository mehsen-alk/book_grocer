import 'package:book_grocer/config/values_manager.dart';
import 'package:book_grocer/features/home/domain/entities/entities.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookInfo extends StatelessWidget {
  final HomeBookInfo book;

  const BookInfo({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageContainer(
          image: book.imageLink,
          height: AppSize.s180.h,
          width: AppSize.s127.w,
          right: AppPadding.p20.w,
          left: AppPadding.p20.w,
        ),
        Container(
          width: AppSize.s127.w,
          height: AppSize.s70.h,
          padding: EdgeInsets.only(
            top: AppPadding.p8.h,
            bottom: AppPadding.p8.h,
          ),
          child: Text(
            book.title,
            maxLines: 5,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class HeadlineBookList extends StatelessWidget {
  final String title;

  const HeadlineBookList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p10.h).copyWith(
        left: AppPadding.p20.w,
        right: AppPadding.p20.w,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ).tr(),
    );
  }
}

class BookGenresInfo extends StatelessWidget {
  final String packageName;
  final String image1;
  final String image2;
  final String image3;
  final Color color;

  const BookGenresInfo({
    Key? key,
    required this.packageName,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: AppPadding.p20.w,
        left: AppPadding.p20.w,
      ),
      child: Container(
        height: AppSize.s200.h,
        width: AppSize.s250.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppSize.s20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                ImageContainer(
                  image: image1,
                  height: AppSize.s130.h,
                  width: AppSize.s110.h,
                  left: AppPadding.p10.w,
                  right: AppPadding.p10.w,
                  top: AppPadding.p10.h,
                  button: AppPadding.p10.h,
                  alignment: Alignment.centerLeft,
                ),
                ImageContainer(
                  image: image3,
                  height: AppSize.s130.h,
                  width: AppSize.s110.h,
                  alignment: Alignment.center,
                ),
                ImageContainer(
                  image: image2,
                  height: AppSize.s130.h,
                  width: AppSize.s110.h,
                  left: AppPadding.p10.w,
                  right: AppPadding.p10.w,
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
            Text(
              packageName,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final double? right;
  final double? left;
  final double? top;
  final double? button;
  final AlignmentGeometry? alignment;

  const ImageContainer(
      {Key? key,
      required this.image,
      required this.height,
      required this.width,
      this.alignment,
      this.left,
      this.top,
      this.right,
      this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: right ?? 0,
        left: left ?? 0,
        top: top ?? 0,
        bottom: button ?? 0,
      ),
      child: Align(
        alignment: alignment ?? Alignment.center,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s20.r),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
