import 'package:sqflite/sqflite.dart';
import 'package:knovator/models/posts_model.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  factory AppDatabase() => _instance;
  AppDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/knovator.db';

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE posts (
        userId INTEGER,
        id INTEGER PRIMARY KEY,
        title TEXT,
        body TEXT,
        isRead INTEGER
      )
    ''');
  }

  Future<void> addPosts(List<PostsModel> posts) async {
    final db = await database;

    final batch = db.batch();
    for (var post in posts) {
      batch.insert(
        'posts',
        post.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit();
  }

  Future<List<PostsModel>> getPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('posts');

    return List.generate(
      maps.length,
      (i) {
        return PostsModel.fromJson(maps[i]);
      },
    );
  }

  Future<PostsModel?> getPost(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'posts',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return PostsModel.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<void> updatePostReadStatus(int id, bool isRead) async {
    final db = await database;
    await db.update(
      'posts',
      {
        'isRead': isRead ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
