import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeState,
        backgroundColor: _color,
        child: const Icon(
          Icons.change_circle,
        ),
      ),
    );
  }

  void _changeState() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
