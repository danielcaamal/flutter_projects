import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double iconSize = 35;
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.pink,
        backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
        unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: iconSize,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today_outlined,
                size: iconSize,
              ),
              label: "Calendar"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
                size: iconSize,
              ),
              label: "Users")
        ]);
  }
}
