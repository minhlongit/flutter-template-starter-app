import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_app/constants/style/style_constants.dart';
import 'package:starter_app/services/navigation_provider.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider =
        Provider.of<NavigationProvider>(context, listen: false);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Course overview',
            style: TextStyle(
              fontSize: 24,
              color: StyleConstants.textColor,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Show course detail'),
            onPressed: () => navigationProvider.setDashboardIndex(2),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Direct to Calendar detail'),
            onPressed: () {
              navigationProvider.setIndex(1);
              navigationProvider.setCalendarIndex(1);
            },
          ),
          ElevatedButton(
            child: const Text('Direct to Todo detail'),
            onPressed: () {
              navigationProvider.setIndex(2);
              navigationProvider.setTodoIndex(1);
            },
          ),
        ],
      ),
    );
  }
}
