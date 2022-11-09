import 'package:book_grocer/config/values_manager.dart';
import 'package:book_grocer/features/home/domain/entities/entities.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../config/color_manager.dart';
import '../../../../config/font_manager.dart';
import '../../../../config/strings_manager.dart';
import '../../../../core/app/di.dart';
import '../pages/home/bloc/category/category_bloc.dart';
import '../pages/home/category_view.dart';

class BookInfo extends StatelessWidget {
  final Function onTap;
  final HomeBookInfo book;

  const BookInfo({Key? key, required this.book, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onTap();
            },
            child: ImageContainer(
              image: book.imageLink,
              height: AppSize.s180.h,
              width: AppSize.s127.w,
              right: AppPadding.p20.w,
              left: AppPadding.p20.w,
            ),
          ),
          Container(
            width: AppSize.s127.w,
            height: AppSize.s40.h,
            padding: EdgeInsets.only(
              top: AppPadding.p8.h,
            ),
            child: Text(
              book.bookTitle,
              maxLines: 2,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: AppPadding.p20.h),
            child: Text(
              book.author.first,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ColorManager.labelSmallColor),
              maxLines: 2,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}

class HeadlineBookList extends StatelessWidget {
  final String title;

  const HeadlineBookList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ).tr(),
    );
  }
}

class BookGenresInfo extends StatelessWidget {
  final String image1;
  final String image2;
  final String image3;
  final String packageName;
  final Color color;
  final CategoryEvent event;

  const BookGenresInfo(
      {Key? key,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.packageName,
      required this.color,
      required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        initHomeModule();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryView(event: event),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          right: AppPadding.p20.w,
          left: AppPadding.p20.w,
        ),
        child: Container(
          height: AppSize.s220.h,
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
                    height: AppSize.s165.h,
                    width: AppSize.s110.h,
                    left: AppPadding.p10.w,
                    right: AppPadding.p10.w,
                    top: AppPadding.p10.h,
                    button: AppPadding.p10.h,
                    alignment: Alignment.centerLeft,
                  ),
                  ImageContainer(
                    image: image2,
                    height: AppSize.s165.h,
                    width: AppSize.s110.h,
                    alignment: Alignment.center,
                  ),
                  ImageContainer(
                    image: image3,
                    height: AppSize.s165.h,
                    width: AppSize.s110.h,
                    left: AppPadding.p10.w,
                    right: AppPadding.p10.w,
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(AppPadding.p8.h),
                child: Text(
                  packageName,
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
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

  const ImageContainer({
    Key? key,
    required this.image,
    required this.height,
    required this.width,
    this.alignment,
    this.left,
    this.top,
    this.right,
    this.button,
  }) : super(key: key);

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
                  filterQuality: FilterQuality.high,
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => SpinKitFoldingCube(
              itemBuilder: (BuildContext context, int index) {
                return const DecoratedBox(
                  decoration: BoxDecoration(color: ColorManager.black12),
                );
              },
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: ColorManager.error),
          ),
        ),
      ),
    );
  }
}

class HomeErrorView extends StatelessWidget {
  final String errorMessage;
  final Function tryAgainFunction;
  final double topPadding;

  const HomeErrorView(
      {Key? key,
      required this.errorMessage,
      required this.tryAgainFunction,
      required this.topPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Column(
          children: [
            Text(
              errorMessage.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: () => tryAgainFunction(),
              style: Theme.of(context).textButtonTheme.style,
              child: Text(AppStrings.tryAgain.tr()),
            )
          ],
        ),
      ),
    );
  }
}

class HomeLoadingView extends StatelessWidget {
  final double topPadding;

  const HomeLoadingView({
    required this.topPadding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p20.h).copyWith(top: topPadding),
        child: SpinKitFoldingCube(
          itemBuilder: (BuildContext context, int index) {
            return const DecoratedBox(
                decoration: BoxDecoration(color: ColorManager.primary));
          },
          size: AppSize.s70.sp,
        ),
      ),
    );
  }
}

class OpacityTween extends StatelessWidget {
  const OpacityTween(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 700),
      this.curve = Curves.easeInToLinear,
      this.begin = 0.2})
      : super(key: key);
  final Widget child;
  final Duration duration;
  final Curve curve;
  final double begin;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin, end: 1.0),
      duration: duration,
      builder: (_, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }
}

class BookDetailsCard extends StatelessWidget {
  final String image;

  const BookDetailsCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              filterQuality: FilterQuality.high,
              image: imageProvider,
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s40.r)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: AppSize.s20.h,
                  offset: Offset(AppSize.s0.h, AppSize.s20.h))
            ]),
      ),
    );
  }
}

class BookInfoTableItem extends StatelessWidget {
  const BookInfoTableItem(
      {Key? key, required this.title, required this.content})
      : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s170.w,
      height: AppSize.s100.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: AppPadding.p10.h),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: FontSize.s20.sp),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            content,
            style: Theme.of(context).textTheme.headlineMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class BookInfoTable extends StatelessWidget {
  const BookInfoTable({Key? key, required this.book}) : super(key: key);
  final HomeBookInfo book;

  @override
  Widget build(BuildContext context) {
    final bool isSame =
        book.subject[book.subject.length - 1] == book.subject.first;
    return SizedBox(
      width: AppSize.s360.w,
      height: AppSize.s100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BookInfoTableItem(
              title: AppStrings.category.tr(),
              content:
                  "${book.subject.first}${isSame ? "" : ",${book.subject[book.subject.length - 1]}"}"),
          SizedBox(
            width: AppSize.s12.w,
          ),
          BookInfoTableItem(
              title: AppStrings.author.tr(), content: book.author.first),
        ],
      ),
    );
  }
}
