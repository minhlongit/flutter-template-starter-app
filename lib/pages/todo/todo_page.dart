import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_app/pages/todo/todo_list_page.dart';
import 'package:starter_app/pages/todo/todo_detail_page.dart';
import 'package:starter_app/services/navigation_provider.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final List<Widget> todoPages = [
      const TodoListPage(),
      const TodoDetailPage(),
    ];

    return IndexedStack(
      index: navigationProvider.currentTodoIndex,
      children: todoPages,
    );
  }
}
