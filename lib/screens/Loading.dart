import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String apiKey = "afc78b05691f942fec865ba4eb5d2f6d";

  getData(lat, lon) async {
    String latitude = lat == null ? "31.5204" :  lat;
    String longitude = lon == null ? "74.3587" : lon;

    Response response = await get(
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");
    Map data = jsonDecode(response.body);
    Map args = {"data": data};
    print(data);
    // Navigator.pushReplacementNamed(context, "/home", arguments: args);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments != null
        ? ModalRoute.of(context).settings.arguments != null
        : {};
    getData(arguments['lan'], arguments['lon']);
    return Scaffold(
        body: Center(child: LottieBuilder.asset("assets/loading.json")));
  }
}
