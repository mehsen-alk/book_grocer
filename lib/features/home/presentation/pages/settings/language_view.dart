import 'package:book_grocer/config/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/color_manager.dart';
import '../../../../../config/strings_manager.dart';
import 'cubit/locale/locale_cubit.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: ColorManager.primary,
        title: Text(
          "Language",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: ColorManager.white),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(AppStrings.english.tr(context)),
            onTap: (){
              BlocProvider.of<LocaleCubit>(context).changeLanguage('en');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(AppStrings.arabic.tr(context)),
            onTap: () {
              BlocProvider.of<LocaleCubit>(context).changeLanguage('ar');
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
