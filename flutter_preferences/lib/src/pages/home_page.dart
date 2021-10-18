import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'Home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Text('Primary Color'),
        Divider(),
        Text('Gender'),
        Divider(),
        Text('Username'),
        Divider(),
      ]),
    );
  }
}
