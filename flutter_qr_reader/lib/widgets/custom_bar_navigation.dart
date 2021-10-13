import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const currentIndex = 1;
    return BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 0,
        items: [
          _customNavigationBarItem(Icons.map, "Map"),
          _customNavigationBarItem(Icons.compass_calibration, "Directions"),
        ]);
  }

  BottomNavigationBarItem _customNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          size: 30.0,
        ),
        label: label);
  }
}
