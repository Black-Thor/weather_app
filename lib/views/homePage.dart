import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:weather_app/utils/ListPhotos.dart';
import 'package:weather_app/db/cityDb.dart';
import 'package:weather_app/services/meteo_service.dart';
import 'package:weather_app/services/db_service.dart';
import 'package:weather_app/widgets/drawer.dart';
import 'package:weather_app/widgets/next_day.dart';
import '../db/cityDb.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cityController = TextEditingController();

  String date = ("00" + (DateTime.now().hour).toString())
          .substring(((DateTime.now().hour).toString()).length) +
      ":" +
      ("00" + (DateTime.now().minute).toString())
          .substring(((DateTime.now().minute).toString()).length);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        stops: [
          0.70,
          1.0,
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Colors.black,
          Colors.grey,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("MyWeatherApp"),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Lyon"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                    ),
                  ),
                  Text(
                    date.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Center(
                  child: Image(image: AssetImage(photoPokemon[1].imagePath))),
              Center(
                child: Text(
                  photoPokemon[1].name,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.air,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "21 km/h",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.opacity_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "90%",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.light_mode_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "1.5h",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    "17°",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 150,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1.0, color: Colors.white))),
                  child: nextDay(photoPokemon),
                ),
              ),
            ],
          ),
        ),
        drawer: myDrawer(context, cityController),
      ),
    );
  }
}
