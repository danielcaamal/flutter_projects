import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/pages/pages.dart';
import 'package:flutter_qr_reader/providers/ui_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UIProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'map': (_) => const MapPage(),
        },
        theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Colors.deepPurple),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepPurple)),
      ),
    );
  }
}
