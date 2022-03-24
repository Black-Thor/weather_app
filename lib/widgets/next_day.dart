import 'package:flutter/material.dart';
import 'package:weather_app/models/meteo.dart';
import 'package:weather_app/services/meteo_service.dart';

Widget nextDay(List photoPokemon) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 20.0),
    height: 150.0,
    child: ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 150.0,
          child: Column(children: [
            const Text(
              "Demain",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(photoPokemon[1].imagePath),
                width: 75,
              ),
            ),
            const Text(
              "17°",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ]),
        ),
        Container(
          decoration: const BoxDecoration(
              border:
                  Border(left: BorderSide(width: 1.0, color: Colors.white))),
          width: 150.0,
          child: Column(children: [
            const Text(
              "J+2",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(photoPokemon[2].imagePath),
                width: 75,
              ),
            ),
            const Text(
              "17°",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ]),
        ),
        Container(
          decoration: const BoxDecoration(
              border:
                  Border(left: BorderSide(width: 1.0, color: Colors.white))),
          width: 150.0,
          child: Column(children: [
            const Text(
              "J+3",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(photoPokemon[3].imagePath),
                width: 75,
              ),
            ),
            const Text(
              "17°",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ]),
        ),
        Container(
          decoration: const BoxDecoration(
              border:
                  Border(left: BorderSide(width: 1.0, color: Colors.white))),
          width: 150.0,
          child: Column(children: [
            const Text(
              "J+4",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(photoPokemon[0].imagePath),
                width: 75,
              ),
            ),
            const Text(
              "17°",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ]),
        ),
      ],
    ),
  );
}
