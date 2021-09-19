import 'package:flutter/material.dart';
import 'package:karim_trips_app/fragments/card_fragment.dart';
import 'package:karim_trips_app/fragments/gradient_back_fragment.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const <Widget>[GradientBack("Bienvenido"), CardList()],
    );
  }
}
