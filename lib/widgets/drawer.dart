import 'package:flutter/material.dart';
import 'package:weather_app/views/homePage.dart';

Widget myDrawer(BuildContext context, TextEditingController cityController) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Text(
              "Nom de la ville",
              style: TextStyle(color: Colors.white),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                child: const Text("Add a City"),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextField(
                                  controller: cityController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Quel ville ajouter ? ',
                                  ),
                                ),
                                ElevatedButton(
                                  child: const Text('Add City'),
                                  onPressed: () {
                                    //insertCity(cityController, database);
                                  },
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
            ],
          ),
        )
      ],
    ),
  );
}
