import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Designs App"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text("Click in the button to see the designs"),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/design1'),
                  child: const Text("Design #1")),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/design2'),
                  child: const Text("Design #2"))
            ]),
      ),
    );
  }
}
