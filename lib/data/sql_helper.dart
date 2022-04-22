import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  /**
   * create Table
   */
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        username TEXT,
        password TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  /**
   * openDatabase
   */
  static Future<sql.Database> db() async {
    return sql.openDatabase('users.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  /**
   * create Item = Insert
   */
  static Future<int> insert(String username, String password) async {
    final db = await SQLHelper.db();

    final data = {'username': username, 'password': password};
    final id = await db.insert('users', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  /**
   * Read
   */
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return await db.query('users');

    // return db.query('users', orderBy: "id");
  }

  /**
   * Read From Id
   */
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('users', where: "id = ?", whereArgs: [id], limit: 1);
  }

  /**
   * Update
   */
  static Future<int> updateItem(
      int id, String username, String password) async {
    final db = await SQLHelper.db();

    final data = {
      'username': username,
      'password': password,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('users', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  /**
   * Delete
   */
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("users", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
