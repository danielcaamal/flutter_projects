import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        decoration: _boxDecoration(),
        child: child,
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(boxShadow: const [
      BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))
    ], color: Colors.white, borderRadius: BorderRadius.circular(25));
  }
}
