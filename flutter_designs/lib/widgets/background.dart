import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const boxDecoration = BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.8],
            colors: [Color(0xff2e305f), Color(0xff202333)]));
    Size media = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Dark background
        Container(
          decoration: boxDecoration,
        ),
        // Pink Box
        Positioned(
            top: media.height * -0.2,
            child: PinkBox(
              height: media.height * 0.5,
              width: media.width * 0.8,
            ))
      ],
    );
  }
}

class PinkBox extends StatelessWidget {
  final double width;
  final double height;
  const PinkBox({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boxDecorationPink = BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(60),
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.2,
              0.8
            ],
            colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1)
            ]));

    return Transform.rotate(
      angle: -pi / 4.0,
      child: Container(
        width: width,
        height: height,
        decoration: boxDecorationPink,
      ),
    );
  }
}
