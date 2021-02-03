import 'package:flutter/material.dart';
import 'package:simple_location_picker/simple_location_picker_screen.dart';
import 'package:simple_location_picker/simple_location_result.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Weather/models/weather.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

//
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
        // appBar: AppBar(
        //   title: ,
        // ),
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weather.name,
                          style: GoogleFonts.lato(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          DateFormat("EEE, d LLL").format(DateTime.now()),
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.location_on, color: Colors.deepOrange,),
                      onPressed: () {
                        double latitude = selectedLocation != null
                            ? selectedLocation.latitude
                            : 31.5102;
                        double longitude = selectedLocation != null
                            ? selectedLocation.longitude
                            : 74.3441;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SimpleLocationPicker(
                                      initialLatitude: latitude,
                                      initialLongitude: longitude,
                                      appBarTitle: "Select Location",
                                      zoomLevel: 8,
                                      appBarColor: Colors.deepOrange,
                                      markerColor: Colors.deepOrange,
                                    ))).then((value) {
                          if (value != null) {
                            setState(() {
                              selectedLocation = value;
                              Navigator.pushReplacementNamed(
                                  context, "/loading",
                                  arguments: selectedLocation);
                            });
                          }
                        });
                      })
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
              child: Column(children: [
                Transform.scale(
                    scale: 2,
                    child: SvgPicture.asset("assets/svgs/${weather.icon}")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weather.temperature.toString(),
                      style: GoogleFonts.lato(
                        fontSize: 65,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "°C",
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
                Text(
                  weather.condition,
                  style: GoogleFonts.lato(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Feels like ${weather.feelsLike}°C",
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
                
              ]),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text("Visibility",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            "${weather.visibility} km",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text("Humidity",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            "${weather.humidity}%",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text("Pressure",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            "${weather.pressure}mb",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
