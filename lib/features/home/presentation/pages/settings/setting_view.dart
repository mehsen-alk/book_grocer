import 'package:book_grocer/config/app_localizations.dart';
import 'package:book_grocer/config/color_manager.dart';
import 'package:book_grocer/config/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../config/strings_manager.dart';

class SettingsView extends StatelessWidget {

  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: ColorManager.primary,
          title: Text(
            AppStrings.appTitle.tr(context),
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: ColorManager.white),
          ),
        ),
        body: Column(
          children: [
            ListTile(
                title: Text(AppStrings.profile.tr(context)),
                onTap: () {},
                trailing: const Icon(Icons.account_circle),
                iconColor: ColorManager.primary),
            ListTile(
              title: Text(AppStrings.language.tr(context)),
              onTap: () async {
                Navigator.pushNamed(context, Routes.languageRoute);
              },
              trailing: const Icon(Icons.language),
              iconColor: ColorManager.primary,
            ),
            ListTile(
              title: Text(AppStrings.darkMode.tr(context)),
              onTap: () {},
              trailing: const Icon(Icons.dark_mode),
              iconColor: ColorManager.primary,
            ),
            ListTile(
              title: Text(AppStrings.logout.tr(context)),
              onTap: () {},
              trailing: const Icon(Icons.logout),
              iconColor: ColorManager.primary,
            ),
            ListTile(
              title: Text(AppStrings.contactUs.tr(context)),
              onTap: () {},
              trailing: const Icon(Icons.support_agent),
              iconColor: ColorManager.primary,
            ),
          ],
        ));
  }
}
