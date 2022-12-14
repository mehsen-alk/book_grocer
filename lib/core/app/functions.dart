import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../config/color_manager.dart';
import '../../config/values_manager.dart';

bool isEmailFormatCorrect(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isMobileNumberCorrect(String mobileNumber) {
  return RegExp(r"^[+]*[0-9]+").hasMatch(mobileNumber);
}

_isCurrentDialogShowing(BuildContext context) =>
    ModalRoute.of(context)?.isCurrent != true;

dismissDialog(BuildContext context) {
  if (_isCurrentDialogShowing(context)) {
    Navigator.of(context, rootNavigator: true).pop(true);
  }
}

void showCustomDialog(BuildContext context,
    {String? message, String? jsonPath}) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    dismissDialog(context);
    showDialog(
      context: context,
      builder: (_) => Center(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p8.h),
          child: Card(
            color: ColorManager.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (jsonPath != null)
                  Padding(
                    padding: EdgeInsets.all(AppPadding.p10.h),
                    child: Lottie.asset(jsonPath),
                  ),
                if (message != null)
                  Padding(
                    padding: EdgeInsets.all(AppPadding.p10.h),
                    child: Center(
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                if (jsonPath == null && message == null)
                  Padding(
                    padding: EdgeInsets.all(AppPadding.p8.h),
                    child: const CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  });
}
