import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karim_trips_app/fragments/description_place_fragment.dart';
import 'package:karim_trips_app/fragments/header_appbar.dart';
import 'package:karim_trips_app/fragments/review_fragment.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const String lorem =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sodales sem nec felis accumsan, ut tempus lectus suscipit. Praesent feugiat erat sed quam vulputate feugiat. Vestibulum pretium ante ac nibh dapibus lacinia. Aenean ultricies auctor felis, ut blandit eros vulputate sed. Donec ut lorem viverra, egestas ex non, laoreet metus. Cras quis vulputate eros, non bibendum lorem. Sed nec tellus dapibus, placerat odio id, condimentum risus.";

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: const [
              DescriptionPlace("Bahamas", 4, lorem),
              ReviewList()
            ],
          ),
          const HeaderAppBar(),
        ],
      ),
    );
  }
}
