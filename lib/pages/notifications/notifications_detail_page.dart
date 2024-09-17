import 'package:flutter/material.dart';
import 'package:starter_app/constants/style/style_constants.dart';

class NotificationsDetailPage extends StatelessWidget {
  const NotificationsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Detail notification',
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
