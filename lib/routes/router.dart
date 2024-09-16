import 'package:flutter/material.dart';
import 'package:starter_app/pages/error/no_internet_page.dart';
import 'package:starter_app/pages/landing_page.dart';
import 'package:starter_app/pages/splash_page.dart';
import 'package:starter_app/pages/undefined_page.dart';
import 'package:starter_app/routes/routes_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesConstants.splashScreenRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SplashPage(),
      );

    case RoutesConstants.landingRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const LandingPage(),
      );

    case RoutesConstants.noInternetRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const NoInternetPage(),
      );

    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => UndefinedPage(name: settings.name),
      );
  }
}
