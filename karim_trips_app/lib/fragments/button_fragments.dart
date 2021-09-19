import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
  final String buttonText;
  const ButtonHome(this.buttonText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: 150.0,
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.indigo,
          child: InkWell(
            borderRadius: BorderRadius.circular(30.0),
            onTap: () {},
            onLongPress: () {},
            splashColor: Colors.white,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                      fontFamily: "Lato", fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
