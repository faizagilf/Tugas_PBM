import 'package:tugas7/customer.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  // ignore: unused_field
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    return _database = await _initializeDb();
  }

  static const String _tableName = 'customers';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'customer_db.db'),
      onCreate: (db, version) async {
        await db.execute(
            '''CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, nama TEXT, nohp TEXT)''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertCustomer(Customer customer) async {
    final Database db = await database;
    await db.insert(
      _tableName,
      customer.toMap(),
    );
  }

  Future<List<Customer>> getCustomers() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableName);

    return result.map((res) => Customer.fromMap(res)).toList();
  }

  Future<void> deleteCustomer(int id) async {
    final Database db = await database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateCustomer(Customer customer) async {
    final Database db = await database;
    await db.update(_tableName, customer.toMap(),
        where: 'id = ?', whereArgs: [customer.id]);
  }
}
