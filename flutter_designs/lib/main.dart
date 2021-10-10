import 'package:flutter/material.dart';
import 'package:flutter_designs/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const HomePage(),
        '/design1': (context) => const DesignPage1(),
        '/design2': (context) => const DesignPage2(),
        '/design3': (context) => const DesignPage3()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
