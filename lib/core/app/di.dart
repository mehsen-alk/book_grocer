import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/data_sources/auth_prefs.dart';
import '../../features/auth/data/data_sources/firebase.dart';
import '../../features/auth/data/repository/repository_impl.dart';
import '../../features/auth/domain/repository/repository.dart';
import '../network/network_info.dart';
import 'app_prefs.dart';

final GetIt instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // auth prefs instance
  instance.registerLazySingleton<AuthPreferences>(
      () => AuthPreferences(instance<SharedPreferences>()));
  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance<SharedPreferences>()));
  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  //instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
}

Future<void> initAuthenticationModule() async {
  if (!GetIt.I.isRegistered<Repository>()) {
    instance.registerLazySingleton<Repository>(
        () => RepositoryImp(instance(), instance()));
    instance.registerLazySingleton<FirebaseHelper>(() => FirebaseHelper());
  }
}
