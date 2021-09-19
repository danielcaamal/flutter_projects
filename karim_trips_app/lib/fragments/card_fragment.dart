import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.0,
      child: ListView(
        padding: const EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          CardImage(pathImage: "assets/img/beach.jpeg"),
          CardImage(pathImage: "assets/img/mountain.jpeg"),
          CardImage(pathImage: "assets/img/river.jpeg"),
          CardImage(pathImage: "assets/img/mountain_stars.jpeg"),
          CardImage(pathImage: "assets/img/sunset.jpeg"),
          CardImage(pathImage: "assets/img/beach_palm.jpeg"),
        ],
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  final String pathImage;

  const CardImage({this.pathImage = "assets/img/beach.jpeg", Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 350.0,
      width: 250.0,
      margin: const EdgeInsets.only(top: 80.0, left: 20.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ],
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage))),
    );

    return card;
  }
}
