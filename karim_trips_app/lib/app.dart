import 'package:flutter/material.dart';
import 'package:karim_trips_app/pages/home_page.dart';
import 'package:karim_trips_app/pages/profile_page.dart';
import 'package:karim_trips_app/pages/search_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  final List<Widget> widgetChildren = const [
    HomePage(title: "Karim Trips"),
    SearchPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Karim Trips App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: widgetChildren[_index],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xf2ffffff),
          fixedColor: Colors.indigo,
          currentIndex: _index,
          onTap: _onTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  void _onTap(int index) {
    setState(() => _index = index);
  }
}
