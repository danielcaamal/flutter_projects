import 'package:flutter/material.dart';
import 'package:flutter_preferences/src/share_prefs/user_preferences.dart';
import 'package:flutter_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = 'Settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final prefs = UserPreferences();
  bool _secondaryColor = false;
  int _gender = 1;
  String _name = 'Jean';

  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _gender = prefs.gender;
    _secondaryColor = prefs.secondaryColor;
    _name = prefs.username;
    prefs.lastPage = SettingsPage.routeName;
    _controller = TextEditingController(text: _name);
  }

  void _setSelectedRadio(int? value) {
    if (value != null) {
      prefs.gender = value;
      _gender = value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
        ),
        drawer: const MenuWidget(),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              child: const Text(
                'Settings',
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            SwitchListTile(
                value: _secondaryColor,
                title: const Text('Secondary Color'),
                onChanged: (value) {
                  _secondaryColor = value;
                  prefs.secondaryColor = value;
                  setState(() {});
                }),
            RadioListTile(
                value: 1,
                title: const Text('Male'),
                groupValue: _gender,
                onChanged: _setSelectedRadio),
            RadioListTile(
                value: 2,
                title: const Text('Female'),
                groupValue: _gender,
                onChanged: _setSelectedRadio),
            const Divider(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    helperText: 'Username',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    )),
                onChanged: (value) {
                  prefs.username = value;
                },
              ),
            )
          ],
        ));
  }
}
