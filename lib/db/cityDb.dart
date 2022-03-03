import '../models/forecast_weather.dart';
import '../models/meteo.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final Database = _initDb();

class Cities {
  final int id;
  final String name;

  Cities({
    required this.id,
    required this.name,
  });

  // ignore: empty_constructor_bodies
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Cities{id: $id, name: $name}';
  }
}

void _initDb() async {
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'city_saved.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE city(id AUTOINCREMENT INTEGER PRIMARY KEY, name TEXT)',
      );
    },
    version: 1,
  );

  Future<void> insertCity(Cities cityObj) async {
    final db = await database;
    await db.insert(
      'city',
      cityObj.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  var london = Cities(
    id: 0,
    name: 'london',
  );

  await insertCity(london);
}
