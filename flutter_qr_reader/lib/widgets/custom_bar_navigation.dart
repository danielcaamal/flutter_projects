import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uIProvider = Provider.of<UIProvider>(context);
    final currentIndex = uIProvider.selectedMenuOpt;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      items: [
        _customNavigationBarItem(Icons.map, "Map"),
        _customNavigationBarItem(Icons.compass_calibration, "Directions"),
      ],
      onTap: (selection) => uIProvider.selectedMenuOpt = selection,
    );
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
