// ignore_for_file: avoid_print

import 'dart:async';

import 'package:eng_mobile_app/routes/routes.dart';
import 'package:eng_mobile_app/services/global/global_service.dart';
import 'package:flutter/material.dart';
import 'package:eng_mobile_app/routes/pages.dart';
import 'package:eng_mobile_app/pages/layout/layout.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'utils/helpers.dart';

final navigatorKey = GlobalKey<NavigatorState>();
String startPage = Routes.ERROR;

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      GetIt.I.registerSingleton<GlobalService>(GlobalService());

      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      await onLoadApp();
      FlutterNativeSplash.remove();

      runApp(const ProviderScope(child: MyApp()));
    },
    (Object error, StackTrace stackTrace) async {
      printError('Triggers asynchrounous error');
      final String errorAndTrace =
          "${error.toString()} '\n' ${stackTrace.toString()}";
      print(errorAndTrace);
    },
  );

  FlutterError.onError = (FlutterErrorDetails errorDetails) {
    printError('This triggers synchronous error');
    print(errorDetails.stack);
  };
}

Future<void> onLoadApp() async {
  printDebug('Fetching global settings....');
  final backend = GetIt.I.get<GlobalService>();
  bool globalSettingsRespOk = await backend.fetchGlobalSettings();

  if (!globalSettingsRespOk) {
    startPage = Routes.ERROR;
    return;
  }

  if (backend.shouldUpdateApp) {
    startPage = Routes.NEW_APP_VERSION;
    return;
  }

  startPage = Routes.HOME;
}

Future<bool> checkAPIVersion() async {
  return true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, widget) => Layout(widget!),
          title: 'Material App',
          navigatorKey: navigatorKey,
          initialRoute: startPage,
          routes: Pages.routes),
    );
  }
}
