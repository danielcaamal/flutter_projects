import 'package:flutter/material.dart';
import 'package:flutter_preferences/src/pages/home_page.dart';
import 'package:flutter_preferences/src/pages/settings_page.dart';
import 'package:flutter_preferences/src/share_prefs/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = UserPreferences();
    return MaterialApp(
      title: 'Preferences App',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SettingsPage.routeName: (_) => const SettingsPage(),
      },
    );
  }
}
