import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _paragraphStyle = const TextStyle(fontSize: 25);
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Título"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Número de clicks",
              style: _paragraphStyle,
            ),
            Text(
              '$_counter',
              style: _paragraphStyle,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _createButtons(),
    );
  }

  Widget _createButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _createFloatingActionButton(Icons.exposure_zero, _reset),
          const Expanded(
            child: SizedBox(),
          ),
          _createFloatingActionButton(Icons.exposure_minus_1, _decrement),
          const SizedBox(
            width: 5.0,
          ),
          _createFloatingActionButton(Icons.exposure_plus_1, _increment)
        ],
      ),
    );
  }

  Widget _createFloatingActionButton(IconData icon, cb) {
    return FloatingActionButton(child: Icon(icon), onPressed: cb);
  }

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() => _counter--);
  void _reset() => setState(() => _counter = 0);
}
