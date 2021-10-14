import 'dart:io';
import 'package:flutter_qr_reader/models/scan_model.dart';
export 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider db = DBProvider._();
  DBProvider._();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          type TEXT,
          value TEXT
        )
      ''');
    });
  }

  Future<int> insertScanRaw(ScanModel newScan) async {
    final db = await database;
    final id = newScan.id;
    final type = newScan.type;
    final value = newScan.value;

    final res = await db.rawInsert('''
      INSERT INTO Scans(id, type, value)
      VALUES ($id, $type, $value)
    ''');
    return res;
  }

  Future<int> insertScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>?> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty
        ? res.map((s) => ScanModel.fromJson(s)).toList()
        : null;
  }

  Future<List<ScanModel>?> getScansByType(String type) async {
    final db = await database;
    final res = await db.query('Scans', where: 'type = ?', whereArgs: [type]);
    return res.isNotEmpty
        ? res.map((s) => ScanModel.fromJson(s)).toList()
        : null;
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;
    return await db.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    return await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    return await db.delete('Scans');
  }
}
