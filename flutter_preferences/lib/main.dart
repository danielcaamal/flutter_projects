import 'package:flutter/material.dart';
import 'package:flutter_preferences/src/pages/home_page.dart';
import 'package:flutter_preferences/src/pages/settings_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferences App',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        SettingsPage.routeName: (_) => const SettingsPage(),
      },
    );
  }
}
