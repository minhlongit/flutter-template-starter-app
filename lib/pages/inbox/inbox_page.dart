import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_app/pages/inbox/inbox_list_page.dart';
import 'package:starter_app/pages/inbox/inbox_detail_page.dart';
import 'package:starter_app/services/navigation_provider.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final List<Widget> inboxPages = [
      const InboxListPage(),
      const InboxDetailPage(),
    ];

    return IndexedStack(
      index: navigationProvider.currentInboxIndex,
      children: inboxPages,
    );
  }
}
