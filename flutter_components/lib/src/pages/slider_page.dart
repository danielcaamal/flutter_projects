import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 10.0;
  bool _checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            _createImage()
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Image Size',
        value: _sliderValue,
        min: 10,
        max: 400,
        onChanged: _checkValue
            ? null
            : (newValue) {
                setState(() => _sliderValue = newValue);
              });
  }

  Widget _createImage() {
    return Image(
        width: _sliderValue,
        height: _sliderValue,
        fit: BoxFit.fill,
        image: const NetworkImage(
            "https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"));
  }

  Widget _createCheckbox() {
    /*return Checkbox(
        value: _checkValue,
        shape: ,
        onChanged: (value) => setState(() => _checkValue = value!));
  }*/
    return CheckboxListTile(
        title: const Text("Lock Slider"),
        value: _checkValue,
        onChanged: (value) => setState(() => _checkValue = value!));
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: const Text("Lock Slider"),
        value: _checkValue,
        onChanged: (value) => setState(() => _checkValue = value));
  }
}
