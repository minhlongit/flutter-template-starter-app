import 'package:flutter/material.dart';
import 'package:starter_app/constants/style/style_constants.dart';

class TodoDetailPage extends StatelessWidget {
  const TodoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Detail todo',
            style: TextStyle(
              fontSize: 24,
              color: StyleConstants.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
