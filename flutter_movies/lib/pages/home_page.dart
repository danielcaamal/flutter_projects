import 'package:flutter/material.dart';
import 'package:flutter_movies/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Movies on cinema")),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            // Principal Card
            CardSwiper(),
            MovieSlider(),
          ],
        ),
      ),
    );
  }
}
