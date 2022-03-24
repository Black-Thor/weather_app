import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:weather_app/utils/ListPhotos.dart';
import 'package:weather_app/db/cityDb.dart';
import 'package:weather_app/services/meteo_service.dart';
import 'package:weather_app/services/db_service.dart';
import 'package:weather_app/widgets/next_day.dart';
import '../db/cityDb.dart';
import '../models/meteo.dart';
import '../utils/variable.dart';

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
  late DatabaseHandler handler;
  Meteo? currentData;

  Future getWeatherData(cityController) async {
    print('function getWeather');
    print(cityController);
    currentData = await cityRequest(cityController);
    return currentData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    launchApp().then((value) {
      setState(() {
        CitySelected = value.toString();
      });
    });
  }

  // void initTown() async {
  //   currentData = await cityRequest(CitySelected);
  // }

  @override
  Widget build(BuildContext context) {
    handler = DatabaseHandler();
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
        body: CitySelected == ""
            ? Text("En cours...")
            : FutureBuilder(
                future: getWeatherData(
                    CitySelected), //a modifier pour prendre la ville choisie
                builder: (context, snapshot) {
                  /**
               * changement de background  
               * 
               */
                  late String weatherImage;

                  String _setImage() {
                    String meteoStatus;
                    if (snapshot.connectionState == ConnectionState.waiting)
                      meteoStatus = "Clear";
                    else
                      meteoStatus = "${currentData?.weather?[0].main}";
                    ;

                    print("meteoStatus");

                    print(meteoStatus);
                    switch (meteoStatus) {
                      case "Clear":
                        return weatherImage = photoPokemon[3].imagePath;
                      case "Drizzle":
                        return weatherImage = photoPokemon[3].imagePath;
                      case "Rain":
                        return weatherImage = photoPokemon[2].imagePath;
                      case "Thunderstorm":
                        return weatherImage = photoPokemon[2].imagePath;
                      case "Snow":
                        return weatherImage = photoPokemon[2].imagePath;
                      case "Clouds":
                        return weatherImage = photoPokemon[0].imagePath;
                      default:
                        return weatherImage = photoPokemon[3].imagePath;
                    }

                    // here it returns your _backgroundImage value
                  }

                  String _setStatus() {
                    String meteoStatus;
                    if (snapshot.connectionState == ConnectionState.waiting)
                      meteoStatus = "Clear";
                    else
                      meteoStatus = "${currentData?.weather?[0].main}";
                    ;

                    print("meteoStatus - 2 ");
                    print(meteoStatus);

                    switch (meteoStatus) {
                      case "Clear":
                        return weatherImage = photoPokemon[3].name;
                      case "Drizzle":
                        return weatherImage = photoPokemon[3].name;
                      case "Rain":
                        return weatherImage = photoPokemon[2].name;
                      case "Thunderstorm":
                        return weatherImage = photoPokemon[2].name;
                      case "Snow":
                        return weatherImage = photoPokemon[2].name;
                      case "Clouds":
                        return weatherImage = photoPokemon[0].name;
                      default:
                        return weatherImage = photoPokemon[3].name;
                    }
                    // here it returns your _backgroundImage value
                  }

                  // timeStamp() {
                  //   final DateTime date1 =
                  //       DateTime.fromMillisecondsSinceEpoch(timestamp1 * 1000);
                  //   return date1;

                  //                                     "${timeStamp(currentData?.sys?.sunset)}",

                  // }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(CitySelected),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.transparent),
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
                          // child: Image(
                          //     image: AssetImage(photoPokemon[2].imagePath))
                          child: Image(
                            width: 230,
                            image: AssetImage(_setImage()),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: Text(
                            _setStatus(),
                            //photoPokemon[1].name,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                        Center(
                          child: Text(
                            "station : ${currentData?.name}",
                            //photoPokemon[1].name,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.air,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "${currentData?.wind?.speed!} km/h", //vitesse du vent
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.opacity_outlined,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "${currentData?.main?.humidity!} %", //humidité
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
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
                            Text(
                              "${currentData?.main?.temp!.toInt()}°C", //temperature
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 100,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 1.0, color: Colors.white))),
                            child: nextDay(photoPokemon),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
        drawer: Drawer(
          child: FutureBuilder<List>(
              future: handler.allCities(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text("Loading..."));
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length + 1,
                      itemBuilder: (context, i) {
                        if (i == 0) {
                          return DrawerHeader(
                              decoration:
                                  const BoxDecoration(color: Colors.black),
                              child: Column(children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "Nom de la ville",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: ElevatedButton(
                                          child: const Text("Add a City"),
                                          onPressed: () {
                                            showModalBottomSheet<void>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  height: 150,
                                                  color: Colors.white,
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          TextField(
                                                            controller:
                                                                cityController,
                                                            decoration:
                                                                const InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              hintText:
                                                                  'Quel ville ajouter ? ',
                                                            ),
                                                          ),
                                                          Center(
                                                            child:
                                                                ElevatedButton(
                                                              child: const Text(
                                                                  'Add City'),
                                                              onPressed: () {
                                                                Cities cityObj = Cities(
                                                                    name: cityController
                                                                        .text
                                                                        .toString());
                                                                setState(() {
                                                                  handler.insertCity(
                                                                      cityObj);
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]));
                        } else {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: ListTile(
                                title: Text(snapshot.data![i - 1].name),
                                onTap: () {
                                  setState(() {
                                    CitySelected = snapshot.data![i - 1].name;
                                    initTown(CitySelected);
                                    print("city for init ${CitySelected}");
                                  });
                                },
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      handler.deleteCity(
                                          snapshot.data![i - 1].name);
                                    });
                                  },
                                )),
                          );
                        }
                      });
                } else {
                  return const Text("An error occured.");
                }
              }),
        ),
      ),
    );
  }
}
