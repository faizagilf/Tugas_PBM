// ignore_for_file: unused_field

import 'package:uaspbm/belanja.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    return _database = await _initializeDb();
  }

  static const String _tableName = 'belanjas';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'belanja_db.db'),
      onCreate: (db, version) async {
        await db.execute(
            '''CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, nama TEXT, barang TEXT)''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertBelanja(Belanja belanja) async {
    final Database db = await database;
    await db.insert(
      _tableName,
      belanja.toMap(),
    );
  }

  Future<List<Belanja>> getBelanjas() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableName);

    return result.map((res) => Belanja.fromMap(res)).toList();
  }

  Future<void> deleteBelanja(int id) async {
    final Database db = await database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateBelanja(Belanja belanja) async {
    final Database db = await database;
    await db.update(_tableName, belanja.toMap(),
        where: 'id = ?', whereArgs: [belanja.id]);
  }
}
