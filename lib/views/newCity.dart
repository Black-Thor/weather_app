import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
//geocoding
import 'package:geocoding/geocoding.dart';
//sharedpreference
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/services/db_service.dart';
//API
import '../services/meteo_service.dart';
//db import
import 'package:weather_app/db/cityDb.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:weather_app/models/meteo.dart';

class City extends StatefulWidget {
  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  /**
   * cityControler for text filed
   * int idCity for test 
   * sharedpreference prefs for global 
   * databases db , for init db
   */
  TextEditingController cityController = TextEditingController();
  late int idCity = 0;
  late SharedPreferences prefs;
  late DatabaseHandler handler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler();
    // List city  =  await handler.allCities() ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("new City adding"),
      ),
      body: Center(
          child: Column(
        children: [
          TextField(
            controller: cityController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Quel ville ajouter ? ',
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                // await addCity(cityController.text.toString());
                Cities cityObj = Cities(name: cityController.text.toString());
                handler.insertCity(cityObj);
              },
              child: const Text("Save the CITY")),
          ElevatedButton(
              onPressed: () async {
                // final allCity = await allCities(db);
                // print(allCity);
                List object = await handler.allCities();
                for (Cities data in object) {
                  print(data.name);
                }
              },
              child: const Text("Print the CITY")),
          ElevatedButton(
              onPressed: () {
                cityRequest(cityController);
              },
              child: const Text("CITY")),
          ElevatedButton(
              onPressed: () => cityController.clear(),
              child: const Text('clear Field')),
          ElevatedButton(
              onPressed: () {
                getSharedPreferences(cityController);
              },
              child: const Text("Add City sharedpref")),
          ElevatedButton(
              onPressed: () {
                retrieveStringValue();
              },
              child: const Text('retrieve sharedpref ')),
          ElevatedButton(
              onPressed: () {
                delete();
              },
              child: const Text('delete sharedpref')),
          ElevatedButton(
              onPressed: () => meteoButton(),
              child: const Text('City Data + sharepreference')),
          ElevatedButton(
              onPressed: () => cityHourly(cityController),
              child: const Text('City Hourly')),
        ],
      )),
    );
  }

  meteoButton() async {
    prefs = await SharedPreferences.getInstance();
    for (var i = 0; i <= idCity.bitLength; i++) {
      String? value = prefs.getString(i.toString());
      print(value);
      cityRequest(value);
    }
  }

  getSharedPreferences(cityController) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(idCity.toString(), cityController.text.toString());
    idCity++;
    print(prefs);
  }

  retrieveStringValue() async {
    prefs = await SharedPreferences.getInstance();
    for (var i = 0; i <= idCity.bitLength; i++) {
      String? value = prefs.getString(i.toString());
      print(value);
    }
  }

  delete() async {
    prefs = await SharedPreferences.getInstance();
    for (var i = 0; i <= idCity.bitLength; i++) {
      prefs.remove(i.toString());
    }
  }
}
