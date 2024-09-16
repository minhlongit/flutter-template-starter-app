import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:starter_app/pages/auth/login_page.dart';
import 'package:starter_app/pages/auth/signup_page.dart';
import 'package:starter_app/services/navigation_provider.dart';
import 'package:starter_app/widgets/custom_app_bar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final List<Widget> authPages = [
      const LoginPage(),
      const SignupPage(),
    ];

    return Scaffold(
      appBar: navigationProvider.currentAuthIndex == 0
          ? null
          : CustomAppBar(
              title: AppLocalizations.of(context)!.signup,
              showBackButton: true,
              onBackPressed: () {
                navigationProvider.setAuthIndex(0);
              },
            ),
      body: IndexedStack(
        index: navigationProvider.currentAuthIndex,
        children: authPages,
      ),
    );
  }
}
