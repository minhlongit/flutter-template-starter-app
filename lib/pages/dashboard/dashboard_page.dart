import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_app/pages/dashboard/courses_list_page.dart';
import 'package:starter_app/pages/dashboard/course_page.dart';
import 'package:starter_app/pages/dashboard/course_detail_page.dart';
import 'package:starter_app/services/navigation_provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final List<Widget> dashboardPages = [
      const CoursesListPage(),
      const CoursePage(),
      const CourseDetailPage(),
    ];

    return IndexedStack(
      index: navigationProvider.currentDashboardIndex,
      children: dashboardPages,
    );
  }
}
