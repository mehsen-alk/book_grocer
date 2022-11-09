import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/color_manager.dart';
import '../../../../../config/strings_manager.dart';
import '../../../../../config/values_manager.dart';
import '../../widgets/home_widgets.dart';
import '../../widgets/home_list.dart';
import 'bloc/home/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetBooksLists()),
      child: Scaffold(
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
                          AppStrings.homeTitle,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: ColorManager.white),
                        ).tr(),
                      ],
                    ),
                  ),
                ),
                PopularBookListContent(topPadding: AppPadding.p120.h),
              ]),
              const HeadlineBookList(title: AppStrings.shortStories),
              ShortStoriesBookListContent(
                topPadding: AppPadding.p20.h,
              ),
              const HeadlineBookList(title: AppStrings.recentlyViewed),
              RecentBookListContent(topPadding: AppPadding.p20.h),
              const HeadlineBookList(title: AppStrings.genres),
              BookGenresInfoList(verticalPadding: AppPadding.p20.h,),
            ],
          ),
        ),
      ),
    );
  }
}
