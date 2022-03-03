import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/meteo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/meteo_service.dart';

class City extends StatefulWidget {
  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  TextEditingController cityController = TextEditingController();
  late int idCity = 0;
  late SharedPreferences prefs;

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
              onPressed: () => meteoButton(), child: const Text('City Data'))
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
