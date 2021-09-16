import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/counter_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Center(child: CounterPage()));
  }
}
