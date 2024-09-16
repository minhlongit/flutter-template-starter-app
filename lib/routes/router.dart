import 'package:flutter/material.dart';
import 'package:starter_app/pages/error/no_internet_page.dart';
import 'package:starter_app/pages/main_page.dart';
import 'package:starter_app/pages/splash_page.dart';
import 'package:starter_app/pages/undefined_page.dart';
import 'package:starter_app/pages/auth/auth_page.dart';
import 'package:starter_app/routes/routes_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesConstants.splashScreenRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SplashPage(),
      );

    case RoutesConstants.mainRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const MainPage(),
      );

    case RoutesConstants.noInternetRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const NoInternetPage(),
      );

    case RoutesConstants.authRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const AuthPage(),
      );

    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => UndefinedPage(name: settings.name),
      );
  }
}
