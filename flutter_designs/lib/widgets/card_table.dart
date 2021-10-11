import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _SingleCard("General", Icons.border_all, Colors.blue.shade300),
          _SingleCard("Transport", Icons.directions_bus_outlined,
              Colors.purple.shade300)
        ]),
        TableRow(children: [
          _SingleCard("Shopping", Icons.shop_outlined, Colors.pink.shade300),
          _SingleCard("Bill", Icons.description_rounded, Colors.orange.shade300)
        ]),
        TableRow(children: [
          _SingleCard("Entertainment", Icons.movie_creation_outlined,
              Colors.red.shade300),
          _SingleCard("Food", Icons.fastfood_outlined, Colors.green.shade300)
        ])
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  const _SingleCard(this.title, this.icon, this.color, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(62, 66, 107, 0.7));

    return _CardBackground(
      child: Container(
        height: 150,
        decoration: boxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color,
              child: Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(color: color, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  const _CardBackground({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: child),
      ),
    );
  }
}
