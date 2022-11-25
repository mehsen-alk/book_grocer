import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_localizations.dart';
import '../../config/language_manager.dart';
import '../../config/routes_manager.dart';
import '../../config/theme_manager.dart';
import '../../features/home/presentation/pages/home/bloc/home_bloc.dart';
import '../../features/home/presentation/pages/settings/cubit/locale_cubit.dart';

class MyApp extends StatefulWidget {
  // named constructor
  const MyApp._internal();

  static const MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleCubit>(
            create: (context) => LocaleCubit()..getSavedLanguage()),
        BlocProvider<HomeBloc>(
            create: (context) =>
                HomeBloc()..add(GetBooksLists()))
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          if (state is ChangeLocalState) {
            return ScreenUtilInit(
              builder: (BuildContext context, Widget? child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  AppLocalizations.delegate,
                ],
                supportedLocales: const [englishLocal, arabicLocal],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                locale: state.locale,
                onGenerateRoute: RouteGenerator.getRoute,
                initialRoute: Routes.splashRoute,
                theme: getApplicationTheme(),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
