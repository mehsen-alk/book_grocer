import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/assets_manager.dart';
import '../../../../../config/color_manager.dart';
import '../../../../../config/strings_manager.dart';
import '../../../../../config/values_manager.dart';
import '../../widgets/book_info.dart';
import '../../widgets/book_list.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final List<BookInfo> _bookInfoList = [
    const BookInfo(
      bookName: "book1",
      bookInfo: "book info1",
      image: ImageAssets.inALandOfPaperGods,
    ),
    const BookInfo(
      bookName: "book2",
      bookInfo: "book info2",
      image: ImageAssets.book2020,
    ),
    const BookInfo(
      bookName: "book3",
      bookInfo: "book info3",
      image: ImageAssets.tattletale,
    ),
    const BookInfo(
      bookName: "book4",
      bookInfo: "book info4",
      image: ImageAssets.theZoo,
    ),
    const BookInfo(
      bookName: "book5",
      bookInfo: "book info5",
      image: ImageAssets.dissapearanceOfEmileZola,
    ),
    const BookInfo(
      bookName: "book6",
      bookInfo: "book info6",
      image: ImageAssets.howToBeTheBestInTimeAndSpace,
    ),
    const BookInfo(
      bookName: "book7",
      bookInfo: "book info7",
      image: ImageAssets.fatherhood,
    ),
  ];
  final List<BookGenresInfo> _bookGenresInfoList = [
    BookGenresInfo(
      packageName: "Graphic Novels",
      image1: ImageAssets.dissapearanceOfEmileZola,
      image2: ImageAssets.inALandOfPaperGods,
      image3: ImageAssets.fatherhood,
      color: ColorManager.darkPrimary,
    ),
    BookGenresInfo(
      packageName: "Graphic Novels",
      image1: ImageAssets.dissapearanceOfEmileZola,
      image2: ImageAssets.inALandOfPaperGods,
      image3: ImageAssets.fatherhood,
      color: ColorManager.error,
    ),
    BookGenresInfo(
      packageName: "Graphic Novels",
      image1: ImageAssets.dissapearanceOfEmileZola,
      image2: ImageAssets.inALandOfPaperGods,
      image3: ImageAssets.fatherhood,
      color: ColorManager.blue,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, k) => [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ColorManager.primary,
            elevation: AppSize.s0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.primary,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: AppSize.s260,
                    decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(AppSize.s240.r))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppPadding.p160.h,
                          right: AppPadding.p20.w,
                          left: AppPadding.p20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.homeTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: ColorManager.white),
                          ).tr(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                              size: AppSize.s30.h,
                              color: ColorManager.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BookList(
                    list: _bookInfoList,
                    top: AppPadding.p80.h,
                    height: AppSize.s260,
                  )
                ],
              ),
              const HeadlineBookList(title: AppStrings.bestsellers),
              BookList(
                list: _bookInfoList,
                height: AppSize.s260,
              ),
              const HeadlineBookList(
                title: AppStrings.genres,
              ),
              BookList(
                list: _bookGenresInfoList,
                height: AppSize.s190,
                bottom: AppPadding.p10,
              ),
              const HeadlineBookList(title: AppStrings.recentlyViewed),
              BookList(
                list: _bookInfoList,
                height: AppSize.s260,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
