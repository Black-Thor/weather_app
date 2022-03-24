import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast_weather.dart';
import 'package:weather_app/services/meteo_service.dart';

Widget nextDay(List photoPokemon, citySelected) {
  return FutureBuilder(
    future: getForecastData(citySelected),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: Text("Loading..."));
      } else if (snapshot.connectionState == ConnectionState.done) {
        return Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: forecastData!.list!.length,
              itemBuilder: (context, i) {
                late String weatherImage;
                String _setImage() {
                  //en switch case à faire
                  print(forecastData!.list![i].weather![0].main);
                  String meteoStatus =
                      "${forecastData!.list![i].weather![0].main}";
                  switch (meteoStatus) {
                    case "Clear":
                      if (citySelected == "Kiev") {
                        return weatherImage = photoPokemon[4].imagePath;
                      } else {
                        return weatherImage = photoPokemon[3].imagePath;
                      }
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
                    case "Mist":
                      return weatherImage = photoPokemon[2].imagePath;
                    default:
                      return weatherImage = photoPokemon[3].imagePath;
                  }
                }

                if (forecastData!.list![i].dtTxt!.contains("12:00:00")) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.5),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      width: 150.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text(
                            "${forecastData!.list![i].dtTxt?.substring(0, 10)}",
                            style: const TextStyle(color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(_setImage()),
                              width: 75,
                            ),
                          ),
                          Text("${forecastData!.list![i].weather![0].main}"),
                          Text(
                            "${forecastData!.list![i].main!.tempMax?.toInt()}°C",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ));
      } else {
        return const Text("An error occured.");
      }
    },
  );

  /*
    child: ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        
        Container(
          decoration: const BoxDecoration(
              border:
                  Border(left: BorderSide(width: 1.0, color: Colors.white))),
          width: 150.0,
          child: Column(children: [
            const Text(
              "J+2",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(photoPokemon[2].imagePath),
                width: 75,
              ),
            ),
            const Text(
              "17°",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ]),
        ),
        Container(
          decoration: const BoxDecoration(
              border:
                  Border(left: BorderSide(width: 1.0, color: Colors.white))),
          width: 150.0,
          child: Column(children: [
            const Text(
              "J+3",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(photoPokemon[3].imagePath),
                width: 75,
              ),
            ),
            const Text(
              "17°",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ]),
        ),
        Container(
          decoration: const BoxDecoration(
              border:
                  Border(left: BorderSide(width: 1.0, color: Colors.white))),
          width: 150.0,
          child: Column(children: [
            const Text(
              "J+4",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(photoPokemon[0].imagePath),
                width: 75,
              ),
            ),
            const Text(
              "17°",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ]),
        ),
      ],
    ),
  );*/
}

ForecastWeather? forecastData;
Future<void> getForecastData(cityController) async {
  forecastData = await cityHourly(cityController);
}
