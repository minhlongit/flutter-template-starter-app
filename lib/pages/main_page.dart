import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:starter_app/pages/dashboard/dashboard_page.dart';
import 'package:starter_app/pages/calendar/calendar_page.dart';
import 'package:starter_app/pages/inbox/inbox_page.dart';
import 'package:starter_app/pages/todo/todo_page.dart';
import 'package:starter_app/pages/notifications/notifications_page.dart';
import 'package:starter_app/services/navigation_provider.dart';
import 'package:starter_app/widgets/custom_app_bar.dart';
import 'package:starter_app/widgets/custom_drawer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    final List<Widget> pages = [
      const DashboardPage(),
      const CalendarPage(),
      const TodoPage(),
      const NotificationsPage(),
      const InboxPage(),
    ];

    String getTitle(int index) {
      switch (index) {
        case 0:
          return AppLocalizations.of(context)!.dashboard;
        case 1:
          return AppLocalizations.of(context)!.calendar;
        case 2:
          return AppLocalizations.of(context)!.todo;
        case 3:
          return AppLocalizations.of(context)!.notifications;
        case 4:
          return AppLocalizations.of(context)!.inbox;
        default:
          return '';
      }
    }

    bool showBackButton() {
      switch (navigationProvider.currentIndex) {
        case 0:
          return navigationProvider.currentDashboardIndex != 0;
        case 1:
          return navigationProvider.currentCalendarIndex != 0;
        case 2:
          return navigationProvider.currentTodoIndex != 0;
        case 3:
          return navigationProvider.currentNotificationsIndex != 0;
        case 4:
          return navigationProvider.currentInboxIndex != 0;
        default:
          return false;
      }
    }

    void onBackPressed() {
      switch (navigationProvider.currentIndex) {
        case 0:
          if (navigationProvider.currentDashboardIndex > 0) {
            navigationProvider.setDashboardIndex(
                navigationProvider.currentDashboardIndex - 1);
          }
          break;
        case 1:
          if (navigationProvider.currentCalendarIndex > 0) {
            navigationProvider
                .setCalendarIndex(navigationProvider.currentCalendarIndex - 1);
          }
          break;
        case 2:
          if (navigationProvider.currentTodoIndex > 0) {
            navigationProvider
                .setTodoIndex(navigationProvider.currentTodoIndex - 1);
          }
          break;
        case 3:
          if (navigationProvider.currentNotificationsIndex > 0) {
            navigationProvider.setNotificationsIndex(
                navigationProvider.currentNotificationsIndex - 1);
          }
          break;
        case 4:
          if (navigationProvider.currentInboxIndex > 0) {
            navigationProvider
                .setInboxIndex(navigationProvider.currentInboxIndex - 1);
          }
          break;
      }
    }

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        title: getTitle(navigationProvider.currentIndex),
        showBackButton: showBackButton(),
        onBackPressed: onBackPressed,
      ),
      body: IndexedStack(
        index: navigationProvider.currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard_outlined),
            label: AppLocalizations.of(context)!.dashboard,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_month_outlined),
            label: AppLocalizations.of(context)!.calendar,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.task_outlined),
            label: AppLocalizations.of(context)!.todo,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications_outlined),
            label: AppLocalizations.of(context)!.notifications,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.email_outlined),
            label: AppLocalizations.of(context)!.inbox,
          ),
        ],
        currentIndex: navigationProvider.currentIndex,
        onTap: (index) => navigationProvider.setIndex(index),
      ),
    );
  }
}
