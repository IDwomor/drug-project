/*
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('drugs.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const drugTable = '''
    CREATE TABLE drugs (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      drugName TEXT NOT NULL,
      drugExpiry TEXT NOT NULL,
      drugUniqueIdentifier TEXT NOT NULL
    )
    ''';
    await db.execute(drugTable);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<int> insertDrug(Map<String, dynamic> drug) async {
    final db = await instance.database;
    return await db.insert('drugs', drug);
  }

  Future<Map<String, dynamic>?> getDrugByUniqueIdentifier(String identifier) async {
    final db = await instance.database;

    final maps = await db.query(
      'drugs',
      columns: ['drugName', 'drugExpiry', 'drugUniqueIdentifier'],
      where: 'drugUniqueIdentifier = ?',
      whereArgs: [identifier],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      return null;
    }
  }
}
*/
