import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_app/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:starter_app/constants/style/style_constants.dart';
import 'package:starter_app/services/locale_service_provider.dart';
import 'package:starter_app/services/loading_service_provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final localeProvider = Provider.of<LocaleServiceProvider>(context);
    final loadingProvider = Provider.of<LoadingServiceProvider>(
      context,
      listen: false,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadingProvider.startLoading();
      Future.delayed(const Duration(seconds: 5), () {
        loadingProvider.stopLoading();
      });
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleConstants.scaffoldBackgroundColor,
        toolbarHeight: size.height * 0.1,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          AppLocalizations.of(context)!.appName,
          style: const TextStyle(
            fontSize: 20,
            color: StyleConstants.colorTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Locale>(
                value:
                    localeProvider.locale ?? L10n.allLanguagesSupported.first,
                icon: const Icon(
                  Icons.language,
                  color: StyleConstants.colorTitle,
                ),
                dropdownColor: StyleConstants.dropdownBackgroundColor,
                style: const TextStyle(
                  color: StyleConstants.dropdownTextColor,
                  fontWeight: FontWeight.bold,
                ),
                items: L10n.allLanguagesSupported.map((Locale locale) {
                  return DropdownMenuItem<Locale>(
                    value: locale,
                    child: Text(
                      locale.languageCode.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: StyleConstants.dropdownTextColor,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) {
                    localeProvider.setLocale(newLocale);
                  }
                },
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.helloWorld,
          style: const TextStyle(
            fontSize: 24,
            color: StyleConstants.textColor,
          ),
        ),
      ),
    );
  }
}
