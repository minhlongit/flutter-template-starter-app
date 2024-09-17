import 'package:flutter/material.dart';
import 'package:starter_app/constants/style/style_constants.dart';

class CalendarDetailPage extends StatelessWidget {
  const CalendarDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Detail calendar',
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
