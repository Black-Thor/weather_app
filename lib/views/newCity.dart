import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class City extends StatelessWidget {
  const City({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("new City adding"),
      ),
      body: Center(
          child: Column(
        children: const [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Quel ville ajouter ? ',
            ),
          ),
          ElevatedButton(
            onPressed: null, 
            child: Text("Add City")),
        
          ],
      )),
    );
  }
}
