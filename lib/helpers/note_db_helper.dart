import 'dart:io';

import 'package:note_app/models/note_model.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pp;
import 'package:sqflite/sqflite.dart' as sql;

class NoteDbHelper {
  static NoteDbHelper? _noteDbHelper;
  static sql.Database? _database;

  NoteDbHelper.internal();

  factory NoteDbHelper() {
    return _noteDbHelper ?? NoteDbHelper.internal();
  }

  Future _onCreate(sql.Database db, int version) async {
    String query =
        "CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, user_id INTEGER)";
    await db.execute(query);
  }

  Future _initDatabase() async {
    Directory directory = await pp.getApplicationDocumentsDirectory();
    String pathDb = path.join(directory.path, 'notes.db');
    return await sql.openDatabase(pathDb, version: 1, onCreate: _onCreate);
  }

  Future _getDatabase() async {
    return _database ?? _initDatabase();
  }

  addNewNote(Note note) async {
    sql.Database db = await _getDatabase();
    return await db.insert("notes", note.toMap());
  }

  getAllNotes() async {
    sql.Database db = await _getDatabase();
    return await db.query('notes');
  }

  getNotesWithId(int userId) async {
    sql.Database db = await _getDatabase();
    return await db.query("notes", where: 'user_id = ?', whereArgs: [userId]);
  }

  updateNote(Note note) async {
    sql.Database db = await _getDatabase();
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  deleteAllPersonalNotes(int userId) async {
    sql.Database db = await _getDatabase();
    return await db.delete('notes', where: 'user_id = ?', whereArgs: [userId]);
  }

  deleteNote(int id) async {
    sql.Database db = await _getDatabase();
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
