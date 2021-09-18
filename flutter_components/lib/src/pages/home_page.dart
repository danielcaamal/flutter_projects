import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icon_string_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Components"),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: const [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createListItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _createListItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> options = [];

    for (var element in data!) {
      final temp = ListTile(
        leading: getIcon(element["icon"]),
        title: Text(element['texto']),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.pushNamed(context, element["ruta"]);
        },
      );

      options
        ..add(temp)
        ..add(const Divider(
          color: Colors.blue,
        ));
    }
    return options;
  }
}
