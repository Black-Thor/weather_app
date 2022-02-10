import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'newCity.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyWeatherApp"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const City()));
          },
          child: const Text("Adding"),
        ),
      ),
    );
  }
}
