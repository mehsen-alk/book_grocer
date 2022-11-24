import 'package:flutter/material.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: AppSize.s280.h,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(AppSize.s240.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: AppPadding.p80.h,
                      bottom: AppPadding.p160.h,
                      right: AppPadding.p20.w,
                      left: AppPadding.p20.w),
                  child: Row(
                    children: [
                      Text(
                      AppStrings.homeTitle.tr(context),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: ColorManager.white),
                      ),
                    ],
                  ),
                ),
              ),
              PopularBookListContent(topPadding: AppPadding.p120.h),
            ]),
            HeadlineBookList(title: AppStrings.shortStories.tr(context)),
            ShortStoriesBookListContent(
              topPadding: AppPadding.p20.h,
            ),
            HeadlineBookList(title: AppStrings.recentlyViewed.tr(context)),
            RecentBookListContent(topPadding: AppPadding.p20.h),
            HeadlineBookList(title: AppStrings.genres.tr(context)),
            BookGenresInfoList(verticalPadding: AppPadding.p20.h,),
          ],
        ),
      ),
    );
  }
}
