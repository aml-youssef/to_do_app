import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task.dart';

class TaskDatabase {
  static final TaskDatabase instance = TaskDatabase._init();
  static Database? _database;
  TaskDatabase._init();
  // const TaskDatabase();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('tasks.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dpPath = await getDatabasesPath();
    final path = join(dpPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  FutureOr<void> _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    // const integerType = 'INTEGER NOT NULL';

    await db.execute('''
        CREATE TABLE $tasksTableName (
          ${TaskFields.id} $idType,
          ${TaskFields.title} $textType,
          ${TaskFields.date} $textType,
          ${TaskFields.startTime} $textType,
          ${TaskFields.endTime} $textType,
          ${TaskFields.reminder} $textType,
          ${TaskFields.isComplete} $boolType,
          ${TaskFields.isFavorite} $boolType 
        ) 
    ''');
  }

  Future<Task> insertRow(Task task) async {
    final db = await instance.database;

    final id = await db.insert(
      tasksTableName,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return task.copyWith(id: id);
  }

  Future<Task> readSingleRow(int id) async {
    final db = await instance.database;

    final map = await db.query(
      tasksTableName,
      columns: TaskFields.values(),
      where: '${TaskFields.id} = ?',
      whereArgs: [id],
    );

    if (map.isNotEmpty) {
      return Task.fromMap(map.first);
    } else {
      throw Exception('3o3o3oo3o3o3o this item is not in database');
    }
  }

  Future<List<Task>> readAllRows() async {
    final db = await instance.database;

    // const orderBy = '$tasksTableName ASC';

    final map = await db.query(
      tasksTableName,
      // orderBy: orderBy,
    );
    if (map.isNotEmpty) {
      return map.map((task) => Task.fromMap(task)).toList();
    } else {
      throw Exception('3o3o3oo3o3o3o no items in database');
    }
  }

  Future<int> update(Task task) async {
    final db = await instance.database;

    return db.update(
      tasksTableName,
      task.toMap(),
      where: '${TaskFields.id} = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tasksTableName,
      where: '${TaskFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
