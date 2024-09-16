import 'package:flutter/material.dart';
import 'package:starter_app/widgets/custom_app_bar.dart';

class UndefinedPage extends StatelessWidget {
  final String? name;
  const UndefinedPage({Key? key, this.name = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Undefined View"),
      body: Center(
        child: Text("Route for $name is not defined"),
      ),
    );
  }
}
