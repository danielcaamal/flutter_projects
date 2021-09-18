import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {
  const HomeTemp({Key? key}) : super(key: key);

  final options = const ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Componentes Temp"),
          centerTitle: true,
        ),
        body: ListView(children: _createListTileMapVersion()));
  }

  List<Widget> _createListTile() {
    List<Widget> list = [];
    for (String opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      // Cascade Operation
      list
        ..add(tempWidget)
        ..add(const Divider(
          color: Colors.black,
        ));
    }
    return list;
  }

  List<Widget> _createListTileMapVersion() {
    return options.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + "!"),
            subtitle: const Text("This is Subtitle"),
            leading: const Icon(Icons.accessibility_new_outlined),
            trailing: const Icon(Icons.arrow_forward),
          ),
          const Divider(
            color: Colors.black,
          )
        ],
      );
    }).toList();
  }
}
