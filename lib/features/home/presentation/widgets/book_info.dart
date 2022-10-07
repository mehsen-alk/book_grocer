import 'package:book_grocer/config/values_manager.dart';
import 'package:book_grocer/features/home/domain/entities/entities.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../config/color_manager.dart';

class BookInfo extends StatelessWidget {
  final HomeBookInfo book;

  const BookInfo({Key? key, required this.book}) : super(key: key);

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
          height: AppSize.s60.h,
          padding: EdgeInsets.only(
            top: AppPadding.p8.h,
          ),
          child: Text(
            book.bookTitle,
            maxLines: 3,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          book.author.first,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: ColorManager.labelSmallColor),
          maxLines: 2,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        )
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
      padding: EdgeInsets.only(
        bottom: AppPadding.p20.h,
        left: AppPadding.p20.w,
        right: AppPadding.p20.w,
        top: AppPadding.p10.w,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ).tr(),
    );
  }
}

class BookGenresInfo extends StatelessWidget {
  final List<HomeBookInfo> bookList;
  final Color color;

  const BookGenresInfo({
    Key? key,
    required this.bookList,
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
                  image: bookList[0].imageLink,
                  height: AppSize.s130.h,
                  width: AppSize.s110.h,
                  left: AppPadding.p10.w,
                  right: AppPadding.p10.w,
                  top: AppPadding.p10.h,
                  button: AppPadding.p10.h,
                  alignment: Alignment.centerLeft,
                ),
                ImageContainer(
                  image: bookList[1].imageLink,
                  height: AppSize.s130.h,
                  width: AppSize.s110.h,
                  alignment: Alignment.center,
                ),
                ImageContainer(
                  image: bookList[2].imageLink,
                  height: AppSize.s130.h,
                  width: AppSize.s110.h,
                  left: AppPadding.p10.w,
                  right: AppPadding.p10.w,
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
            Text(
              bookList[0].jsonTitle,
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
        child: SizedBox(
          height: height,
          width: width,
          child: CachedNetworkImage(
            imageUrl: image,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s20.r),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => SpinKitFoldingCube(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(color: ColorManager.black12),
                );
              },
            ),
            errorWidget: (context, url, error) =>
                Icon(Icons.error, color: ColorManager.error),
          ),
        ),
      ),
    );
  }
}
