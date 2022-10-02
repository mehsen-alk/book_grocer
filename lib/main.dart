import 'package:bloc/bloc.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'bloc_observer.dart';
import 'config/language_manager.dart';
import 'core/app/app.dart';
import 'core/app/di.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initAppModule();


  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [englishLocal, arabicLocal],
      path: assetPathLocalization,
      child: MyApp(),
    ),
  );
}
