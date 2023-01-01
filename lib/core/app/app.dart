import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_localizations.dart';
import '../../config/language_manager.dart';
import '../../config/routes_manager.dart';
import '../../config/theme_manager.dart';
import '../../features/home/presentation/pages/home/bloc/home_bloc.dart';
import '../../features/home/presentation/pages/settings/cubit/locale/locale_cubit.dart';

class MyApp extends StatelessWidget {
  // named constructor
  const MyApp._internal();

  static const MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleCubit>(
            create: (context) => LocaleCubit()..getSavedLanguage()),
        BlocProvider<HomeBloc>(
            create: (context) => HomeBloc()..add(GetBooksLists())),
        // BlocProvider<ThemeCubit>(
        //     create: (context) => ThemeCubit()..getCurrentTheme())
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          if (state is ChangeLocalState) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
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
                theme: getApplicationLightTheme(),
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
