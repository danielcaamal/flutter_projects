import 'package:flutter/material.dart';

class FloatingActionIcon extends StatefulWidget {
  const FloatingActionIcon({Key? key}) : super(key: key);

  @override
  _FloatingActionIconState createState() => _FloatingActionIconState();
}

class _FloatingActionIconState extends State<FloatingActionIcon> {
  bool _stateButton = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _onPressed,
      backgroundColor: const Color(0xFF11DA53),
      tooltip: "Fav",
      mini: true,
      child: _stateButton
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border),
    );
  }

  void _onPressed() {
    setState(() => _stateButton = !_stateButton);
  }
}
