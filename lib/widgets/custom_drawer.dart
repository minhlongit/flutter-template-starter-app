import 'package:flutter/material.dart';
import 'package:starter_app/constants/style/style_constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: StyleConstants.scaffoldBackgroundColor,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 24,
                  color: StyleConstants.colorTitle,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Trang chủ'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cài đặt'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.5),
                  height: 1,
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Đăng xuất'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
