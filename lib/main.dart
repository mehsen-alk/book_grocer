import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'config/language_manager.dart';
import 'core/app/app.dart';
import 'core/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();

  runApp(
    EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSET_PATH_LOCALISATIONS,
      child: MyApp(),
    ),
  );
}
