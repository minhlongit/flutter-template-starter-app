import 'package:flutter/material.dart';

class UndefinedPage extends StatelessWidget {
  final String? name;
  const UndefinedPage({Key? key, this.name = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Undefined View")),
      body: Center(
        child: Text("Route for $name is not defined"),
      ),
    );
  }
}
