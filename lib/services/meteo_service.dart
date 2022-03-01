import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/meteo.dart';
import 'package:flutter/widgets.dart';

// Future<List<Meteo>> getmeteoData() async {
//   List<Meteo> meteoData = [];
//  final response = await http.get(
//   Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
//   // Send authorization headers to the backend.
//   headers: {
//     HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
//   },
// );
//  return meteoData;
// }

// Future<List<Location>> getCoordonne() async {
// List<Location> coords = await locationFromAddress(name);
// Uri url = Uri.https("api.openweathermap.org", "/data/2.5/weather",
//   {
//     'lat': coords[0].latitude.toString(),
//     'lon': coords[0].longitude.toString(),
//     'lang': 'fr',
//     'appid': apikey
//   }
// );
// }

Future cityRequest(cityEntries) async {
  List<Location> locations;
  if (cityEntries.runtimeType == String) {
    locations = await locationFromAddress(cityEntries);
  } else {
    locations = await locationFromAddress(cityEntries.text.toString());
  }

  Uri url = Uri.https("api.openweathermap.org", "/data/2.5/weather", {
    'lat': locations[0].latitude.toString(),
    'lon': locations[0].longitude.toString(),
    'units': 'metric',
    'lang': 'fr',
    'appid': '109e23b902d8a46b4fcca288e80abc1d'
  });

  print(url);

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponde = jsonDecode(response.body);
    print(jsonResponde);
    print(Meteo.fromJson(jsonResponde));
    return Meteo.fromJson(jsonResponde);
  } else {
    print('Failed to get data');
  }
}
