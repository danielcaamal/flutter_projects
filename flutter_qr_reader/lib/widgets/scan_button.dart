import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:flutter_qr_reader/providers/scan_provider.dart';
import 'package:flutter_qr_reader/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            "#ff6666", "Cancel", false, ScanMode.DEFAULT);

        if (barcodeScanRes == '-1') {
          return;
        }
        final scanProvider = Provider.of<ScanProvider>(context, listen: false);
        ScanModel newScan = await scanProvider.newScan(barcodeScanRes);
        launchURL(context, newScan);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
