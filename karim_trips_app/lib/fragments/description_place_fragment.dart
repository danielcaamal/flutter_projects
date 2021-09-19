import 'package:flutter/material.dart';

class DescriptionPlace extends StatelessWidget {
  final String namePlace;
  final int stars;
  final String descriptionPlace;
  const DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emptyStar = Container(
      margin: const EdgeInsets.only(top: 323, right: 3.0),
      child: const Icon(
        Icons.star_border,
        color: Colors.yellow,
      ),
    );

    final halfStar = Container(
      margin: const EdgeInsets.only(top: 323, right: 3.0),
      child: const Icon(
        Icons.star_half,
        color: Colors.yellow,
      ),
    );

    final star = Container(
      margin: const EdgeInsets.only(top: 323, right: 3.0),
      child: const Icon(
        Icons.star,
        color: Colors.yellow,
      ),
    );

    final description = Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: Text(
        descriptionPlace,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)),
      ),
    );

    final titlestars = Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 320.0, left: 20.0, right: 20.0),
          child: Text(
            namePlace,
            style: const TextStyle(
                fontFamily: "Lato",
                fontSize: 40.0,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: <Widget>[star, star, star, star, emptyStar],
        )
      ],
    );

    return Column(
      children: <Widget>[titlestars, description],
    );
  }
}
