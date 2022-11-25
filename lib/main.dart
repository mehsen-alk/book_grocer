import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'core/app/app.dart';
import 'core/app/di.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initAppModule();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  Bloc.observer = MyBlocObserver();
  ErrorWidget.builder = (FlutterErrorDetails details) => Material(
        color: Colors.green.shade200,
        child: Center(
          child: Text(
            details.exception.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      );
  runApp(MyApp());
}
