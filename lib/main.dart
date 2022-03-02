import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FirebaseCrashlytics.instance.setUserIdentifier('Natan');
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  

  runZonedGuarded<Future<void>>(() async {
    runApp(MyApp());
  }, (error, stackTrace) async {
    await FirebaseCrashlytics.instance.recordError(error, stackTrace);
    print('Error: $error');
    print('Stack trace: $stackTrace');
  });

  await Firebase.initializeApp();
}
