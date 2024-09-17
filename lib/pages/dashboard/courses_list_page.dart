import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_app/constants/style/style_constants.dart';
import 'package:starter_app/services/navigation_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CoursesListPage extends StatelessWidget {
  const CoursesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider =
        Provider.of<NavigationProvider>(context, listen: false);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.dashboard,
            style: const TextStyle(
              fontSize: 24,
              color: StyleConstants.textColor,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Show course'),
            onPressed: () => navigationProvider.setDashboardIndex(1),
          ),
        ],
      ),
    );
  }
}
