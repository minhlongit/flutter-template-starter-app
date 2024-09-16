import 'package:flutter/material.dart';
import 'routes/router.dart' as router;
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:starter_app/l10n/l10n.dart';
import 'package:starter_app/themes/themes.dart';
import 'package:starter_app/routes/routes_constants.dart';
import 'package:starter_app/services/locale_service_provider.dart';

class StarterApp extends StatelessWidget {
  const StarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleServiceProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'starter_app',
          theme: lightTheme,
          initialRoute: RoutesConstants.splashScreenRoute,
          locale: provider.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: L10n.allLanguagesSupported,
          onGenerateRoute: router.generateRoute,
        );
      },
    );
  }
}
