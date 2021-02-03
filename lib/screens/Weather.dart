import 'package:flutter/material.dart';
import 'package:simple_location_picker/simple_location_picker_screen.dart';
import 'package:simple_location_picker/simple_location_result.dart';
import 'package:simple_location_picker/utils/slp_constants.dart';
import 'package:Weather/models/weather.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// Text(
//                       "${weather.temperature}",
//                       style: GoogleFonts.lato(
//                         fontSize: 85,
//                         fontWeight: FontWeight.w300,
//                         color: Colors.white,
//                       ),
//                     ),
class Weather extends StatefulWidget {
  Weather({Key key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherData weather;
  SimpleLocationResult selectedLocation;

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    weather = arguments['weatherData'];
    selectedLocation = arguments['selectedLocation'];

    return Scaffold(
        appBar: AppBar(
          title: Text(DateFormat("EEE, d LLLL").format(DateTime.now())),
        ),
        body: ListView(
          children: [
            Text(
              weather.name,
              style: TextStyle(fontSize: 40),
            ),
            RaisedButton(
                child: Text("Pick a Location"),
                onPressed: () {
                  double latitude = selectedLocation != null
                      ? selectedLocation.latitude
                      : 31.5204;
                  double longitude = selectedLocation != null
                      ? selectedLocation.longitude
                      : 74.3587;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SimpleLocationPicker(
                                initialLatitude: latitude,
                                initialLongitude: longitude,
                                appBarTitle: "Select Location",
                                zoomLevel: 15,
                              ))).then((value) {
                    if (value != null) {
                      setState(() {
                        selectedLocation = value;
                        Navigator.pushReplacementNamed(context, "/loading",
                            arguments: selectedLocation);
                      });
                    }
                  });
                })
          ],
        ));
  }
}
