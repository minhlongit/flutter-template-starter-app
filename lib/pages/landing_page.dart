import 'package:flutter/material.dart';
import 'package:starter_app/constants/style/style_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleConstants.scaffoldBackgroundColor,
        toolbarHeight: size.height * 0.1,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Starter App",
          style: TextStyle(
            fontSize: 40,
            color: StyleConstants.colorTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.helloWorld),
      ),
    );
  }
}
