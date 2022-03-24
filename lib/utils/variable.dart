import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/services/meteo_service.dart';

String CitySelected = "";
// late SharedPreferences prefs;
late int idCity = 0;

Future<String> launchApp() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? value = prefs.getString('last');
  print("pref");
  print(value);
  return value ?? "Lyon";
}

initTown(citySelected) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('last', citySelected);
  //String? value = prefs.getString('last');
  // print("city for value  ${value}");
}
