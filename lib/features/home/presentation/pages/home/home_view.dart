import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/color_manager.dart';
import '../../../../../config/strings_manager.dart';
import '../../../../../config/values_manager.dart';
import '../../widgets/book_info.dart';
import '../../widgets/book_list.dart';
import 'bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetTheBookList()),
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
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
                    const BookListContent()
                  ],
                ),
                 const HeadlineBookList(title: AppStrings.bestsellers),
                // BookList(
                //   list: _bookInfoList,
                //   height: AppSize.s260,
                // ),
                // const HeadlineBookList(
                //   title: AppStrings.genres,
                // ),
                // BookList(
                //   list: _bookGenresInfoList,
                //   height: AppSize.s190,
                //   bottom: AppPadding.p10,
                // ),
                // const HeadlineBookList(title: AppStrings.recentlyViewed),
                // BookList(
                //   list: _bookInfoList,
                //   height: AppSize.s260,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
