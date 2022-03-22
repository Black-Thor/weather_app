import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/db/cityDb.dart';

class DatabaseHandler {
  Future<Database> _initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'city_save.db'),
      onCreate: ((db, version) async {
        await db.execute(
          'CREATE TABLE city_save(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(100))',
        );
      }),
      version: 1,
    );
  }

  Future<int> insertCity(Cities cityObj) async {
    final db = await _initDB();
    int result = await db.insert('city_save', cityObj.toMap());
    return result;
  }

  Future<List> allCities() async {
    final db = await _initDB();
    final List<Map<String, dynamic?>> queryResult = await db.query('city_save');
    final query = queryResult.map((e) => Cities.fromMap(e)).toList();
    //print(queryResult);
    //print(query);
    return query;
  }

  Future<int> deleteCity(String cityObj) async {
    final db = await _initDB();
    //return await db.rawQuery('DELETE FROM city_save WHERE `name`=${cityObj}');
    return await db
        .delete('city_save', where: 'name = ?', whereArgs: [cityObj]);
  }

  Future<int> updateCity(Cities cityObj) async {
    final db = await _initDB();
    //return await db.rawQuery('DELETE FROM city_save WHERE `name`=${cityObj}');
    return await db.update('city_save', cityObj.toMap(),
        where: 'name = ?', whereArgs: [cityObj]);
  }
}
