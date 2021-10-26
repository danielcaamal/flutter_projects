import 'package:flutter/material.dart';
import 'package:flutter_preferences/src/share_prefs/user_preferences.dart';
import 'package:flutter_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'Home';

  HomePage({Key? key}) : super(key: key);
  final prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: const MenuWidget(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Divider(),
        Text('Primary Color: ${prefs.secondaryColor}'),
        const Divider(),
        Text('Gender: ${prefs.gender}'),
        const Divider(),
        Text('Username: ${prefs.username}'),
        const Divider(),
      ]),
    );
  }
}
