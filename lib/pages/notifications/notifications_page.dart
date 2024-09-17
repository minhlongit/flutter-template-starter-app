import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_app/pages/notifications/notifications_list_page.dart';
import 'package:starter_app/pages/notifications/notifications_detail_page.dart';
import 'package:starter_app/services/navigation_provider.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final List<Widget> notificationsPages = [
      const NotificationsListPage(),
      const NotificationsDetailPage(),
    ];

    return IndexedStack(
      index: navigationProvider.currentNotificationsIndex,
      children: notificationsPages,
    );
  }
}
