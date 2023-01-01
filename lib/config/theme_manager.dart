import 'package:book_grocer/core/app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

const String themeIndexKey = "Theme_Index";
const String darkMode = "Dark";
const String lightMode = "Light";

class ThemeCacheHelper {
  Future<void> cacheThemeIndex(String themeIndex) async {
    await instance<SharedPreferences>().setString(themeIndexKey, themeIndex);
  }

  Future<String> getCacheThemeIndex() async {
    final cachedThemeIndex =
        instance<SharedPreferences>().getString(themeIndexKey);
    if (cachedThemeIndex != null) {
      return cachedThemeIndex;
    } else {
      return lightMode;
    }
  }
}

ThemeData getApplicationLightTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    brightness: Brightness.light,

    // card view theme
    cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),
    scaffoldBackgroundColor: ColorManager.white,

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: AppSize.s0,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle:
          getRegularStyle(fontSize: FontSize.s16.sp, color: ColorManager.white),
    ),

    // button theme
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s15.sp),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    // text theme
    textTheme: TextTheme(

        /// BookInfo text
        displayLarge: getSemiBoldStyle(
            color: ColorManager.black, fontSize: FontSize.s15.sp),

        /// BookGenresInfo text
        displayMedium:
            getBoldStyle(color: ColorManager.white, fontSize: FontSize.s15.sp),

        /// Highlight Book Details
        headlineLarge: getBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s24.sp),

        /// Text Book Details
        headlineMedium: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s16.sp),

        /// Text title
        titleLarge:
            getBoldStyle(color: ColorManager.black, fontSize: FontSize.s24.sp),

        /// Text Form field
        titleMedium: getRegularStyle(
            color: ColorManager.primary, fontSize: FontSize.s18.sp),

        /// On boarding title
        titleSmall: getMediumStyle(
            color: ColorManager.primary, fontSize: FontSize.s30.sp),
        bodyLarge: getRegularStyle(color: ColorManager.grey1),

        /// On boarding subtitle
        bodySmall: getLightStyle(
            color: ColorManager.primary, fontSize: FontSize.s14.sp),

        /// default text
        bodyMedium: getLightStyle(
            color: ColorManager.primary, fontSize: FontSize.s12.sp),
        labelSmall: getRegularStyle(
            color: ColorManager.labelSmallColor, fontSize: FontSize.s11.sp)),
    iconTheme: IconThemeData(color: ColorManager.white, size: AppSize.s30.sp),
    // input decoration theme (text form field)
    primarySwatch: Colors.teal,
    errorColor: ColorManager.error,
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: EdgeInsets.all(AppPadding.p8.h),

      // hint style
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s15.sp),
      labelStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s15.sp),
      errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border style
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5.w),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s18.r))),

      // focused border style
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5.w),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s18.r))),

      // error border style
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5.w),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s18.r))),

      // focused border style
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5.w),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s18.r))),
    ),

    // text button
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorManager.grey;
            } else {
              return ColorManager.primary;
            }
          },
        ),
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return getLightStyle(
                color: ColorManager.grey, fontSize: FontSize.s12.sp);
          } else {
            return getLightStyle(
                color: ColorManager.primary, fontSize: FontSize.s12.sp);
          }
        }),
      ),
    ),

    // outline button
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorManager.primary;
            } else {
              return ColorManager.white;
            }
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorManager.white;
            } else {
              return ColorManager.primary;
            }
          }),
          side: MaterialStateProperty.resolveWith(
              (states) => const BorderSide(color: ColorManager.primary)),
          elevation: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppSize.s0;
            } else {
              return AppSize.s6.h;
            }
          }),
          shadowColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorManager.white;
            } else {
              return ColorManager.primary;
            }
          }),
          shape: MaterialStateProperty.resolveWith((states) {
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s18));
          })),
    ),
  );
}
ThemeData getApplicationDarkTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    brightness: Brightness.dark,

    // card view theme
    cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),
    scaffoldBackgroundColor: Colors.grey[850],

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: AppSize.s0,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle:
          getRegularStyle(fontSize: FontSize.s16.sp, color: ColorManager.white),
    ),

    // button theme
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s15.sp),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    // text theme
    textTheme: TextTheme(

        /// BookInfo text
        displayLarge: getSemiBoldStyle(
            color: ColorManager.white, fontSize: FontSize.s15.sp),

        /// BookGenresInfo text
        displayMedium:
            getBoldStyle(color: ColorManager.black, fontSize: FontSize.s15.sp),

        /// Highlight Book Details
        headlineLarge: getBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s24.sp),

        /// Text Book Details
        headlineMedium: getSemiBoldStyle(
            color: ColorManager.lightGrey, fontSize: FontSize.s16.sp),

        /// Text title
        titleLarge:
            getBoldStyle(color: ColorManager.white, fontSize: FontSize.s24.sp),

        /// Text Form field
        titleMedium: getRegularStyle(
            color: ColorManager.darkPrimary, fontSize: FontSize.s18.sp),

        /// On boarding title
        titleSmall: getMediumStyle(
            color: ColorManager.darkPrimary, fontSize: FontSize.s30.sp),
        bodyLarge: getRegularStyle(color: ColorManager.grey1),

        /// On boarding subtitle
        bodySmall: getLightStyle(
            color: ColorManager.darkPrimary, fontSize: FontSize.s14.sp),

        /// default text
        bodyMedium: getLightStyle(
            color: ColorManager.darkPrimary, fontSize: FontSize.s12.sp),
        labelSmall: getRegularStyle(
            color: ColorManager.labelSmallColor, fontSize: FontSize.s11.sp)),
    iconTheme: IconThemeData(color: ColorManager.black, size: AppSize.s30.sp),
    // input decoration theme (text form field)
    primarySwatch: Colors.teal,
    errorColor: ColorManager.error,
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: EdgeInsets.all(AppPadding.p8.h),

      // hint style
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s15.sp),
      labelStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s15.sp),
      errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border style
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5.w),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s18.r))),

      // focused border style
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5.w),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s18.r))),

      // error border style
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5.w),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s18.r))),

      // focused border style
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5.w),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s18.r))),
    ),

    // text button
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorManager.grey;
            } else {
              return ColorManager.primary;
            }
          },
        ),
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return getLightStyle(
                color: ColorManager.grey, fontSize: FontSize.s12.sp);
          } else {
            return getLightStyle(
                color: ColorManager.primary, fontSize: FontSize.s12.sp);
          }
        }),
      ),
    ),

    // outline button
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorManager.primary;
            } else {
              return ColorManager.white;
            }
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorManager.white;
            } else {
              return ColorManager.primary;
            }
          }),
          side: MaterialStateProperty.resolveWith(
              (states) => const BorderSide(color: ColorManager.primary)),
          elevation: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppSize.s0;
            } else {
              return AppSize.s6.h;
            }
          }),
          shadowColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorManager.white;
            } else {
              return ColorManager.primary;
            }
          }),
          shape: MaterialStateProperty.resolveWith((states) {
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s18));
          })),
    ),
  );
}
