import 'package:bloc/bloc.dart';
import 'package:cerdastani/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cerdastani/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shimmer/main.dart';

import 'firebase_options.dart';
import 'observer.dart';

void main() async {
  ///widgets binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  ///injection
  await init();
  //env
  await dotenv.load(fileName: "assets/env/.env_dev");

  ///observer
  Bloc.observer = MyObserver();
  // ///widgets binding
  // final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //
  /// await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// initialize firebase and authentication repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterNativeSplash.remove();

  runApp(const App());
}

