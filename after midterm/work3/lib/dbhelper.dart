import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'person.dart';
import 'package:sqflite/sqflite.dart';

class Db_helper {
  static const _databaseName = "db.db";
  static const _databaseVersion = 1;
  static const table = 'my_table';
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnAge = 'age';

  Db_helper._privateConstructor();
  static final Db_helper instance = Db_helper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnAge INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> insert2(Person p) async {
    Database db = await instance.database;
    return await db.insert(table, p.toJson());
  }

  Future<List<Person>> queryAllRow() async {
    Database db = await instance.database;
    final result = await db.query(table);
    return result.map((json) => Person.fromJson(json)).toList();
  }

  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }
}
