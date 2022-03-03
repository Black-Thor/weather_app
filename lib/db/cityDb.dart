import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Cities {
  final String name;

  Cities({
    required this.name,
  });

  // ignore: empty_constructor_bodies
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Cities{name: $name}';
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

  var london = Cities(
    name: 'london',
  );

  await insertCity(london, database);
}

Future<void> insertCity(Cities cityObj, Future<Database> database) async {
  final db = await database;
  await db.insert(
    'city',
    cityObj.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
