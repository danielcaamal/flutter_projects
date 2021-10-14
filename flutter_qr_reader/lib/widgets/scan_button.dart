import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qr_reader/providers/scan_provider.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //    "#ff6666", "Cancel", false, ScanMode.DEFAULT);

        const barcodeScanRes = 'https://fernando-herrera.com';
        final scanProvider = Provider.of<ScanProvider>(context, listen: false);
        scanProvider.newScan(barcodeScanRes);
        scanProvider.newScan('geo:15.33.67');
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
