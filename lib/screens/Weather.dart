import 'package:flutter/material.dart';
import 'package:Weather/models/weather.dart';

class Weather extends StatefulWidget {
  Weather({Key key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherData weather;
  Map data;
  @override
  Widget build(BuildContext context) {
    weather = ModalRoute.of(context).settings.arguments;
    print(weather.name);
    return Scaffold(
      body: Text("")
    );
  }
}
