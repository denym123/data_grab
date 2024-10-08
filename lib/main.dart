import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app.dart';
import 'core/core.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    FlutterError.onError = (FlutterErrorDetails details) {
      ExceptionHandler(details.exception, details.stack);
    };
    runApp(ModularApp(module: AppModule(), child: const AppWidget()));
  }, (error, stackTrace) {
    ExceptionHandler(error, stackTrace);
  });
}
