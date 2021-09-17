import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';

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
        print(snapshot.data);
        return ListView(
          children: _createListItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> _createListItems(List<dynamic>? data) {
    final List<Widget> options = [];

    for (var element in data!) {
      final temp = ListTile(
        leading: const Icon(Icons.text_fields),
        title: Text(element['texto']),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black,
        ),
        onTap: () {},
      );

      options
        ..add(temp)
        ..add(const Divider(
          color: Colors.black,
        ));
    }
    return options;
  }
}
