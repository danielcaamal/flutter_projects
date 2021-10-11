import 'package:flutter/material.dart';
import 'package:flutter_designs/widgets/background.dart';
import 'package:flutter_designs/widgets/card_table.dart';
import 'package:flutter_designs/widgets/custom_bottom_navigation.dart';
import 'package:flutter_designs/widgets/page_title.dart';

class DesignPage3 extends StatelessWidget {
  const DesignPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202333),
      body: Stack(
        children: const [
          // Background
          Background(),
          // Home
          _HomeBody(),
          // CardTable
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          // Tittles
          PageTitle(),
          CardTable(),
        ],
      ),
    );
  }
}
