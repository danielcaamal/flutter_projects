import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avatar Page"),
        actions: <Widget>[
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://st2.depositphotos.com/1104517/11965/v/600/depositphotos_119659092-stock-illustration-male-avatar-profile-picture-vector.jpg"),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              child: Text("SL"),
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
      body: const Center(
        child: FadeInImage(
          fadeInDuration: Duration(milliseconds: 500),
          placeholder: AssetImage("assets/placeholder.gif"),
          image: NetworkImage(
              "https://st2.depositphotos.com/1104517/11965/v/600/depositphotos_119659092-stock-illustration-male-avatar-profile-picture-vector.jpg"),
        ),
      ),
    );
  }
}
