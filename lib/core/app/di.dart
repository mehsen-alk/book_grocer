
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/language_manager.dart';
import '../../features/auth/data/data_sources/auth_prefs.dart';
import '../../features/auth/data/data_sources/firebase.dart';
import '../../features/auth/data/repository/repository_impl.dart';
import '../../features/auth/domain/repository/repository.dart';
import '../../features/home/data/data_sources/search_api.dart';
import '../../features/home/data/repository/search_repository_imp.dart';
import '../../features/home/domain/repository/search_repository.dart';
import '../network/dio_factory.dart';
import '../network/network_info.dart';
import 'app_prefs.dart';

final GetIt instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared pref instance
  final sharedPref = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPref);

<<<<<<< HEAD
  // auth pref instance
  instance.registerLazySingleton<AuthPreferences>(
      () => AuthPreferences(instance<SharedPreferences>()));

=======
  // auth prefs instance
  instance.registerLazySingleton<AuthPreferences>(
      () => AuthPreferences(instance<SharedPreferences>()));
  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance<SharedPreferences>()));
>>>>>>> 5f20c89dfa42ac7d05e17a43a1a47a25fe2cea82
  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // language pref
  instance
      .registerLazySingleton(() => LanguagePref(instance<SharedPreferences>()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(
      () => DioFactory(instance<LanguagePref>()));
}

void initAuthenticationModule() {
  if (!GetIt.I.isRegistered<Repository>()) {
    instance.registerLazySingleton<Repository>(
        () => RepositoryImp(instance(), instance()));
    instance.registerLazySingleton<FirebaseHelper>(() => FirebaseHelper());
  }
}

void initHomeModule() async {
  if (!GetIt.I.isRegistered<SearchRepository>()) {
    instance.registerLazySingleton<SearchRepository>(() => SearchRepositoryImp(
        instance<SearchServiceClient>(), instance<NetworkInfo>()));

    Dio dio = await instance<DioFactory>().getDio();
    instance.registerLazySingleton<SearchServiceClient>(
        () => SearchServiceClient(dio));
  }
}
