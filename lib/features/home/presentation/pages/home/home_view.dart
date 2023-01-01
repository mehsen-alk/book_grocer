import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/app_localizations.dart';
import '../../../../../config/color_manager.dart';
import '../../../../../config/strings_manager.dart';
import '../../../../../config/values_manager.dart';
import '../../widgets/home_widgets.dart';
import '../../widgets/home_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorManager.primary,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: AppSize.s300.h,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSize.s240.r),
                    bottomRight: Radius.circular(AppSize.s240.r),
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20,
                    vertical: AppPadding.p100,
                  ),
                  child: Text(
                    AppStrings.homeTitle.tr(context),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: ColorManager.white),
                  ),
                ),
              ),
              PopularBookListContent(topPadding: AppPadding.p130.h),
            ]),
            HeadlineBookList(title: AppStrings.shortStories.tr(context)),
            ShortStoriesBookListContent(
              topPadding: AppPadding.p20.h,
            ),
            HeadlineBookList(title: AppStrings.recentlyViewed.tr(context)),
            RecentBookListContent(topPadding: AppPadding.p20.h),
            HeadlineBookList(title: AppStrings.genres.tr(context)),
            BookGenresInfoList(
              verticalPadding: AppPadding.p20.h,
            ),
          ],
        ),
      ),
    );
  }
}
