import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final pokedexDatabaseHelperProvider = Provider<DatabaseHelper>((ref) {
  return DatabaseHelper(databaseName: 'pokedex.db');
});

class DatabaseHelper {
  DatabaseHelper({required String databaseName}) : _databaseName = databaseName;

  String _databaseName;
  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      await init();
    }
    return _database!;
  }

  Future<void> init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, _databaseName);
// delete existing if any
    await deleteDatabase(path);
// Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}
// Copy from asset
    ByteData data = await rootBundle.load(join('assets', 'pokedex.db'));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes, flush: true);
// open the database
    _database = await openDatabase(path, readOnly: true);
  }
}
