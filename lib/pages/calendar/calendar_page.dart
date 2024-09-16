import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_app/pages/calendar/calendar_list_page.dart';
import 'package:starter_app/pages/calendar/calendar_detail_page.dart';
import 'package:starter_app/services/navigation_provider.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final List<Widget> calendarPages = [
      const CalendarListPage(),
      const CalendarDetailPage(),
    ];

    return IndexedStack(
      index: navigationProvider.currentCalendarIndex,
      children: calendarPages,
    );
  }
}
