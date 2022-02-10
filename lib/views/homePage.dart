import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/utils/ListPhotos.dart';

import 'newCity.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final now = "15:01";

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
                    now,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Center(
                  child: Image(image: AssetImage(photoPokemon[3].imagePath))),
              Center(
                child: Text(
                  photoPokemon[3].name,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
