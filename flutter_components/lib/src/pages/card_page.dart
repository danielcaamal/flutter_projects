import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          const SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          const SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
        ],
      ),
    );
  }
}

Widget _cardTipo2() {
  final card = Column(
    children: <Widget>[
      const FadeInImage(
          fit: BoxFit.cover,
          height: 300.0,
          fadeInDuration: Duration(seconds: 1),
          placeholder: AssetImage('assets/placeholder.gif'),
          image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Che_ne_saj.jpg/1024px-Che_ne_saj.jpg')),
      Container(
          padding: const EdgeInsets.all(10.0), child: const Text("I am Text"))
    ],
  );

  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0)),
        ],
        borderRadius: BorderRadius.circular(20.0)),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card,
    ),
  );
}

Widget _cardTipo1() {
  return Card(
    elevation: 10.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Column(
      children: <Widget>[
        const ListTile(
          leading: Icon(
            Icons.photo_album,
            color: Colors.blue,
          ),
          title: Text("I am title"),
          subtitle: Text("I am subtitle"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(onPressed: () {}, child: const Text('Cancel')),
            TextButton(onPressed: () {}, child: const Text('Ok'))
          ],
        ),
      ],
    ),
  );
}
