import 'package:flutter/material.dart';

class DesignPage1 extends StatelessWidget {
  const DesignPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Image.asset('assets/landscape.jpg'),
          const TitleWidget(),
          const SizedBox(
            height: 10,
          ),
          const IconsWidget(),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Officia dolor quis cillum do. Elit officia excepteur est est consectetur adipisicing eu et. Excepteur pariatur nulla elit Lorem qui reprehenderit mollit id in minim duis ad exercitation. Dolor qui nulla non qui fugiat nostrud irure proident eu deserunt et. Dolore eiusmod est enim cupidatat ut ex laborum nulla minim. Cupidatat ad officia elit Lorem proident do consectetur sit reprehenderit cupidatat id laborum incididunt in. Officia occaecat et veniam ipsum culpa ea.',
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}

class IconsWidget extends StatelessWidget {
  const IconsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        IconWidget(Icons.call, 'CALL'),
        IconWidget(Icons.send, 'ROUTE'),
        IconWidget(Icons.share, 'SHARE'),
      ],
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const IconWidget(
    this.icon,
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 30.0,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.blue, fontSize: 20.0),
        )
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Laboris excepteur veniam veniam laboris.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Commodo veniam enim eiusmod qui elit.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black45),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          const Text('41')
        ],
      ),
    );
  }
}
