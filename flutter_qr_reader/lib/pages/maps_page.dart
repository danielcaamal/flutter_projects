import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/widgets/scan_list_tiles.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanListTiles('http');
  }
}
