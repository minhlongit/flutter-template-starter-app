import 'package:flutter/material.dart';
import 'package:starter_app/constants/style/style_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.signup,
            style: const TextStyle(
              fontSize: 24,
              color: StyleConstants.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
