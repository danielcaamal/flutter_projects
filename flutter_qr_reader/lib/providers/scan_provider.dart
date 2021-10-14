import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/providers/db_provider.dart';

class ScanProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.insertScan(newScan);
    newScan.id = id;

    if (selectedType == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = scans != null ? [...scans] : [];
    notifyListeners();
  }

  loadScansByType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);
    if (scans != null) {
      this.scans = [...scans];
      selectedType = type;
    } else {
      this.scans = [];
    }
    notifyListeners();
  }

  deleteAlls() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteAllById(int id) async {
    await DBProvider.db.deleteScan(id);
    loadScansByType(selectedType);
  }
}
