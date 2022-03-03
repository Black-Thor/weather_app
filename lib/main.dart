import 'package:flutter/material.dart';
import 'views/homePage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.grey,
    ),
    home: const HomePage(),
  ));
}
