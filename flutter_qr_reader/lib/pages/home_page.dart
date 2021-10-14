import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/pages/pages.dart';
import 'package:flutter_qr_reader/providers/db_provider.dart';
import 'package:flutter_qr_reader/providers/ui_provider.dart';
import 'package:flutter_qr_reader/widgets/scan_button.dart';
import 'package:flutter_qr_reader/widgets/custom_bar_navigation.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Historial"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uIProvider = Provider.of<UIProvider>(context);
    final currentIndex = uIProvider.selectedMenuOpt;

    // TODO:
    final tempScan = ScanModel(value: 'https://holamundo');
    DBProvider.db.insertScan(tempScan);
    DBProvider.db.getScanById(13);
    DBProvider.db.getScansByType('http').then((value) => print(value));

    switch (currentIndex) {
      case 0:
        return const MapsPage();
      case 1:
        return const DirectionsPage();
      default:
        return const MapsPage();
    }
  }
}
