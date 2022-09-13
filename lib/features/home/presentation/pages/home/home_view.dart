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
  final List<HomeInfo> _list = [
    const HomeInfo(
      bookName: "book1",
      bookInfo: "book info1",
      image: ImageAssets.inALandOfPaperGods,
    ),
    const HomeInfo(
      bookName: "book2",
      bookInfo: "book info2",
      image: ImageAssets.book2020,
    ),
    const HomeInfo(
      bookName: "book3",
      bookInfo: "book info3",
      image: ImageAssets.tattletale,
    ),
    const HomeInfo(
      bookName: "book4",
      bookInfo: "book info4",
      image: ImageAssets.theZoo,
    ),
    const HomeInfo(
      bookName: "book5",
      bookInfo: "book info5",
      image: ImageAssets.dissapearanceOfEmileZola,
    ),
    const HomeInfo(
      bookName: "book6",
      bookInfo: "book info6",
      image: ImageAssets.howToBeTheBestInTimeAndSpace,
    ),
    const HomeInfo(
      bookName: "book7",
      bookInfo: "book info7",
      image: ImageAssets.fatherhood,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.primary,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarIconBrightness: Brightness.light),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: AppSize.s260.sp,
                  decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(AppSize.s240.sp))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: AppPadding.p160.sp,
                        right: AppPadding.p20.sp,
                        left: AppPadding.p20.sp),
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
                            Icons.list,
                            size: AppSize.s40,
                            color: ColorManager.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BookList(
                  list: _list,
                  padding: AppPadding.p120,
                )
              ],
            ),
            const Titl1e(title: AppStrings.bestsellers),
            BookList(
              list: _list,
              padding: AppPadding.p20,
            ),
            const Titl1e(
              title: AppStrings.genres,
            )
          ],
        ),
      ),
    );
  }
}
