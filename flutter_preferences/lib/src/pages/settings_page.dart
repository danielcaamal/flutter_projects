import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = 'Settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Center(
          child: Text('Settings'),
        ));
  }
}
