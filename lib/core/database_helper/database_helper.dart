import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  static const servicesTable = 'Services';
  static const subServicesTable = 'SubServices';
  static const servicesIdColumn = 'service_id';
  static const detailedServicesTable = 'DetailedServices';
  static const subServicesIdColumn = 'subservice_id';

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'services.db');

    ByteData data = await rootBundle.load('assets/database/services.db');
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await writeToFile(path, bytes);

    return await openDatabase(path);
  }

  Future<void> writeToFile(String path, List<int> bytes) async {
    final file = File(path);
    await file.writeAsBytes(bytes, flush: true);
  }

  // Fetch all services
  Future<List<Map<String, dynamic>>> getAllServices() async {
    final db = await database;
    return await db.query(servicesTable);
  }

  // Fetch all sub-services for a given service ID
  Future<List<Map<String, dynamic>>> getSubServices(int serviceId) async {
    final db = await database;
    return await db.query(subServicesTable,
        where: '$servicesIdColumn = ?', whereArgs: [serviceId]);
  }

  // Fetch all detailed services for a given sub-service ID
  Future<List<Map<String, dynamic>>> getDetailedServices(
      int subServiceId) async {
    final db = await database;
    return await db.query(detailedServicesTable,
        where: '$subServicesIdColumn = ?', whereArgs: [subServiceId]);
  }
}
