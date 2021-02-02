import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  Weather({Key key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Map data;
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text(""),
    );
  }
}