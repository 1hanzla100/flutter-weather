import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:Weather/models/weather.dart';
import 'package:simple_location_picker/simple_location_result.dart';

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String apiKey = "afc78b05691f942fec865ba4eb5d2f6d";
  SimpleLocationResult arguments;
  getData({lat, lon}) async {
    String latitude = lat == null ? "31.5102" : lat.toString();
    String longitude = lon == null ? "74.3441" : lon.toString();

    Response response = await get(
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");
    Map data = jsonDecode(response.body);

    Navigator.pushReplacementNamed(context, "/weather",
        arguments: {
          "weatherData": WeatherData.fromJson(data),
          "selectedLocation": arguments
        });
  }

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context).settings.arguments;
    Future.delayed(Duration(seconds: 1), () => {
      arguments != null ? getData(lat: arguments.latitude, lon: arguments.longitude) :  getData()
    });
    return Scaffold(
        body: Center(child: LottieBuilder.asset("assets/loading.json")));
  }
}
