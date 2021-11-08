import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [const _PurpleBox(), const _HeaderIcon(), child],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double height = size.height * 0.4;
    double width = size.width;
    return Container(
      width: width,
      height: height,
      decoration: buildBoxDecoration(),
      child: Stack(children: [
        _Bubble(height / 1.5, width / 2.5, height / 2),
        _Bubble(height / 3, width / 1.5, height / 3),
        _Bubble(height / 2, width / 8, height / 4),
        _Bubble(height / 3, width / 2.5, height / 5),
        _Bubble(-height / 10, width / 3.5, height / 3.5),
      ]),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromRGBO(63, 63, 156, 1),
      Color.fromRGBO(90, 70, 178, 1)
    ]));
  }
}

class _Bubble extends StatelessWidget {
  final double left;
  final double top;
  final double width;
  const _Bubble(this.top, this.left, this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromRGBO(255, 255, 255, 0.05)),
      ),
    );
  }
}
