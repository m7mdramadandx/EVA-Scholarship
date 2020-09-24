import 'package:eva_pharma/block/WeatherBloc.dart';
import 'package:eva_pharma/models/Place.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    placeBloc.fetchLondonWeather();
    return StreamBuilder(
        stream: placeBloc.weather,
        builder: (context, AsyncSnapshot<Place> snapshot) {
          if (snapshot.hasData) {
            return _buildWeatherScreen(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Container _buildWeatherScreen(Place data) {
    return Container(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(data.id.toString()),
          Text(data.name.toString()),
          Text(data.lat.toString()),
          Text(data.long.toString()),
        ],
      ),
    );
  }
}
