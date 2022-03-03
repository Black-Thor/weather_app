import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:weather_app/utils/ListPhotos.dart';
import 'package:weather_app/db/cityDb.dart';
import 'package:weather_app/services/meteo_service.dart';
import 'package:weather_app/services/db_service.dart';
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
        drawer: Drawer(
          child: FutureBuilder<List>(
              future: allCities(),
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
                                                                  insertCity(
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
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      deleteCity(snapshot.data![i - 1].name);
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
