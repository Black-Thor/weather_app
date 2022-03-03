import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/meteo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/meteo_service.dart';
import 'package:weather_app/db/cityDb.dart';

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
            decoration: InputDecoration(
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
              child: Text('clear Field')),
          ElevatedButton(
              onPressed: () {
                getSharedPreferences(cityController);
              },
              child: Text("Add City sharedpref")),
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
              onPressed: () => meteoButton(), child: Text('City Data')),
          ElevatedButton(
              onPressed: () => cityHourly(cityController),
              child: Text('City Hourly')),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      color: Colors.amber,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextField(
                              controller: cityController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Quel ville ajouter ? ',
                              ),
                            ),
                            const Text('Modal BottomSheet'),
                            ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text("data"))
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
