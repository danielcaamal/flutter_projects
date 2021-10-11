import 'package:flutter/material.dart';

class DesignPage2 extends StatelessWidget {
  const DesignPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const boxDecoration = BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 0.5],
            colors: [Color(0xE05EE8C5), Color(0xff30BAD6)]));

    return Scaffold(
      body: Container(
        decoration: boxDecoration,
        child: PageView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            children: const [Page1(), Page2()]),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [Background(), MainContent()],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white, fontSize: 60);
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "11°",
            style: textStyle,
          ),
          Text(
            DateTime.now().toLocal().year.toString(),
            style: textStyle,
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 100,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      alignment: Alignment.topCenter,
      child: const Image(
        image: AssetImage('assets/scroll-1.png'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      child: Center(
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            "Bienvenido",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          onPressed: null,
        ),
      ),
    );
  }
}
