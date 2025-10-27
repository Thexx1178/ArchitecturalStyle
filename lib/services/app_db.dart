// lib/services/app_db.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/architecture_entity.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();
  static Database? _database;

  AppDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('architectural_style.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE architecture (
        id $idType,
        name $textType,
        era $textType,
        brief $textType,
        tags $textType
      )
    ''');
  }

  // ➕ CREATE
  Future<int> insertArchitecture(ArchitectureEntity entity) async {
    final db = await instance.database;
    final json = {
      'name': entity.name,
      'era': entity.era,
      'brief': entity.brief,
      'tags': entity.tags.join(','),
    };
    return await db.insert('architecture', json);
  }

  // 📖 READ
  Future<List<ArchitectureEntity>> getAllArchitectures() async {
    final db = await instance.database;
    final result = await db.query('architecture');
    return result.map((row) => ArchitectureEntity(
      name: row['name'] as String,
      era: row['era'] as String,
      brief: row['brief'] as String,
      tags: (row['tags'] as String).split(','),
    )).toList();
  }

  // ✏️ UPDATE
  Future<int> updateArchitecture(String oldName, ArchitectureEntity entity) async {
    final db = await instance.database;
    return await db.update(
      'architecture',
      {
        'name': entity.name,
        'era': entity.era,
        'brief': entity.brief,
        'tags': entity.tags.join(','),
      },
      where: 'name = ?',
      whereArgs: [oldName],
    );
  }

  // ❌ DELETE
  Future<int> deleteArchitecture(String name) async {
    final db = await instance.database;
    return await db.delete('architecture', where: 'name = ?', whereArgs: [name]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
