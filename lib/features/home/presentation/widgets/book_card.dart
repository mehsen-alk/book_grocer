import 'package:book_grocer/config/color_manager.dart';
import 'package:book_grocer/features/auth/presentation/common/widgets.dart';
import 'package:book_grocer/features/home/presentation/widgets/rating_bar.dart';
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
      padding: EdgeInsets.symmetric(vertical: AppPadding.p8.h),
      child: Row(
        children: [
          BookImage(book: book),
          SizedBox(width: AppSize.s12.w),
          BookInfo(book: book)
        ],
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  const BookInfo({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints:
            BoxConstraints(maxWidth: AppSize.s175.w, maxHeight: AppSize.s175.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(context),
            SizedBox(height: AppSize.s4.h),
            _authors(context),
            SizedBox(height: AppSize.s4.h),
            RatingBar(rating: book.averageRating),
            SizedBox(height: AppSize.s4.h),
            _subtitle(context),
            SizedBox(height: AppSize.s8.h),
            FullOutlinedButton(onPressed: () {}, text: 'Add To Wishlist')
          ],
        ),
      ),
    );
  }

  Widget _authors(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: AppSize.s175.w),
      child: Text(
        book.authors.join(', '),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: ColorManager.grey),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: AppSize.s175.w),
      child: Text(
        book.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: ColorManager.darkGrey),
      ),
    );
  }

  Widget _subtitle(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: AppSize.s175.w),
      child: Text(
        book.subtitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: ColorManager.grey2),
      ),
    );
  }
}

class BookImage extends StatelessWidget {
  const BookImage({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(AppSize.s12.h),
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s12.h),
        child: Image.network(
          book.thumbnail,
          loadingBuilder: _loadingImageIndicator,
          width: AppSize.s120.w,
          height: AppSize.s175.h,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _loadingImageIndicator(
      BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
