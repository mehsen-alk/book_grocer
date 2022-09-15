import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../config/assets_manager.dart';
import '../../../../../config/color_manager.dart';
import '../../../../../config/strings_manager.dart';
import '../../../../../config/values_manager.dart';
import '../../widgets/book_info.dart';
import '../../widgets/book_list.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final List<BookInfo> _list = [
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
                  height: AppSize.s260,
                  decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(AppSize.s240))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: AppPadding.p160,
                        right: AppPadding.p20,
                        left: AppPadding.p20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.homeTitle,
                          style: Theme.of(context).textTheme.bodySmall,
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
            const HeadlineBookList(title: AppStrings.bestsellers),
            BookList(
              list: _list,
              padding: AppPadding.p20,
            ),
            const HeadlineBookList(
              title: AppStrings.genres,
            )
          ],
        ),
      ),
    );
  }
}
