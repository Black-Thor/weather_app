import 'dart:_http';
import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/meteo.dart';

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

Future<List<Meteo>> getmeteoData() async {
  List<Meteo> meteoData = [];

  Uri url = Uri.https("api.openweathermap.org", "/data/2.5/weather", {
    'lat' : meteoData[0].coord?.lat.toString(),
    'lon' : meteoData[0].coord?.lon.toString(),

  });

  return meteoData;
}
