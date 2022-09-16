import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import '../../../../config/assets_manager.dart';
import '../../../../config/routes_manager.dart';
import '../../../../core/app/functions.dart';
import '../bloc/authentication_bloc.dart';

manageDialog(BuildContext context, AuthenticationState state) {
  if (state is AuthenticationInProgress) {
    showCustomDialog(context, jsonPath: JsonAssets.loading);
  } else if (state is AuthenticationFailed) {
    showCustomDialog(context,
        jsonPath: JsonAssets.error, message: state.message.tr());
  } else if (state is AuthenticationSuccess) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      dismissDialog(context);
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    });
  }
}
