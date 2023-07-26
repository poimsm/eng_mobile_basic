import 'package:eng_mobile_app/pages/challenge/challenge_page.dart';
import 'package:eng_mobile_app/pages/error/error_page.dart';
import 'package:eng_mobile_app/pages/instructions/instructions_page.dart';
import 'package:eng_mobile_app/pages/languages/language_page.dart';
import 'package:eng_mobile_app/pages/new_version/new_version_page.dart';
import 'package:flutter/material.dart';
import 'package:eng_mobile_app/routes/routes.dart';
import 'package:eng_mobile_app/pages/home/home_page.dart';

// ignore_for_file: constant_identifier_names

abstract class Pages {
  // static const String INITIAL = Routes.SPLASH;

  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.HOME: (_) => HomePage(),
    Routes.CHALLENGE: (_) => ChallengePage(),
    Routes.ERROR: (_) => ErrorPage(),
    Routes.NEW_APP_VERSION: (_) => NewAppVersionPage(),
    Routes.LANGUAGE: (_) => LanguagePage(),
    Routes.INSTRUCTIONS: (_) => InstructionsPage(),
  };
}
