import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sql.dart';
import 'package:visual_notes/Utils/constants.dart';

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'visual_notes.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE ${Constants.tableName}(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,picture TEXT, description TEXT,date TEXT,status INTEGER)');
      },
      version: 1,
    );
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await DBHelper.database();
    return db.query(Constants.tableName);
  }


  static Future<void> insert({required Map<String, Object?> data}) async {
    final db = await DBHelper.database();
   await db.insert(
      Constants.tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );


  }

  static Future<void> update({required Map<String, Object?> values, required String noteId}) async {
    final db = await DBHelper.database();
   await db.update(
      Constants.tableName,
      values,
      where: "${Constants.id}=?",
      whereArgs: [noteId],
    );
  }

  static Future<int> delete(int noteId) async {
    final db = await DBHelper.database();
    return await db.delete(
      Constants.tableName,
      where: '${Constants.id}=?',
      whereArgs: [noteId],
    );
  }

  static Future<int> deleteAllData() async {
    final db = await DBHelper.database();
    return await db.delete(
      Constants.tableName,
    );
  }
}
