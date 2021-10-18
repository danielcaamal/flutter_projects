import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<ScanModel?> launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.value;
  if (scan.type == 'http') {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se puede abrir URL';
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
