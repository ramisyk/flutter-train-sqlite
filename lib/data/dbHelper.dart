import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  Database _db;
  Future<Database> get db async {
    if(_db == null){ //database yoksa
      _db = await initializeDb();
    }
    return _db;
  }
  Future<Database> initializeDb() async{
    String dbPath = join(await getDatabasesPath(), "etrade.db");
    var eTradeDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return eTradeDb;
  }

  void createDb(Database db, int version) async{
    await db.execute("Create table products(id integer primary key, name text, description text, unitPrice integer)");
  }
}