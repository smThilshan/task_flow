import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/task_model.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  late Database _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  // Initialize the database
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'tasks.db');

    _database = await openDatabase(
      path,
      version: 2, // Increment version
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            dueDate TEXT
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE tasks ADD COLUMN description TEXT');
          await db.execute('ALTER TABLE tasks ADD COLUMN dueDate TEXT');
        }
      },
    );
  }

  // CRUD Operations

  Future<List<TaskModel>> getTasks() async {
    final List<Map<String, dynamic>> maps = await _database.query('tasks');
    return List.generate(maps.length, (i) {
      return TaskModel.fromMap(maps[i]);
    });
  }

  Future<void> insertTask(TaskModel task) async {
    await _database.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateTask(TaskModel task) async {
    await _database
        .update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<void> deleteTask(int id) async {
    await _database.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
