import 'package:flutter/material.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Review(
        'assets/img/people.jpg', "User Name", "Details", "Comment");
  }
}

class Review extends StatelessWidget {
  final String username;
  final String pathImage;
  final String details;
  final String comment;
  const Review(this.pathImage, this.username, this.details, this.comment,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emptyStar = Container(
      margin: const EdgeInsets.only(top: 3, right: 3.0),
      child: const Icon(
        Icons.star_border,
        color: Colors.yellow,
      ),
    );

    final halfStar = Container(
      margin: const EdgeInsets.only(top: 3, right: 3.0),
      child: const Icon(
        Icons.star_half,
        color: Colors.yellow,
      ),
    );

    final star = Container(
      margin: const EdgeInsets.only(top: 3, right: 3.0),
      child: const Icon(
        Icons.star,
        color: Colors.yellow,
      ),
    );

    final userComment = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(comment,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: "Lato",
              fontSize: 13.0,
              color: Color(0xFFa3a5a7))),
    );

    final userInfo = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(details,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFa3a5a7))),
    );

    final userName = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(username,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 17.0,
          )),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            userInfo,
            Row(
              children: <Widget>[star, star, star, star, emptyStar],
            )
          ],
        ),
        userComment
      ],
    );

    final photo = Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(pathImage), fit: BoxFit.fill),
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[photo, userDetails],
    );
  }
}
