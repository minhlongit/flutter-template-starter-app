import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_app/constants/style/style_constants.dart';
import 'package:starter_app/services/navigation_provider.dart';
import 'package:starter_app/routes/routes_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider =
        Provider.of<NavigationProvider>(context, listen: false);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.login,
            style: const TextStyle(
              fontSize: 24,
              color: StyleConstants.textColor,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: Text(AppLocalizations.of(context)!.login),
            onPressed: () => Navigator.pushReplacementNamed(
                context, RoutesConstants.mainRoute),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: Text(AppLocalizations.of(context)!.signup),
            onPressed: () => navigationProvider.setAuthIndex(1),
          ),
        ],
      ),
    );
  }
}