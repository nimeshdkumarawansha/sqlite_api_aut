import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('user.db');
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

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        userCode TEXT PRIMARY KEY,
        displayName TEXT,
        email TEXT,
        employeeCode TEXT,
        companyCode TEXT
      )
    ''');
  }

  Future<void> saveUser(User user) async {
    final db = await instance.database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<User?> getUser(String userCode) async {
  final db = await instance.database;
  final List<Map<String, dynamic>> maps = await db.query(
    'users',
    where: 'userCode = ?',
    whereArgs: [userCode],
  );

  if (maps.isNotEmpty) {
    return User.fromJson(maps.first);
  }
  return null;
}

Future<List<User>> getAllUsers() async {
  final db = await instance.database;
  final List<Map<String, dynamic>> maps = await db.query('users');
  return List.generate(maps.length, (i) => User.fromJson(maps[i]));
}

Future<void> deleteUser(String userCode) async {
  final db = await instance.database;
  await db.delete(
    'users',
    where: 'userCode = ?',
    whereArgs: [userCode],
  );
}
}