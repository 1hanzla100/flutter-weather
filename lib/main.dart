import 'package:flutter/material.dart';
import 'package:simple_location_picker/simple_location_picker_screen.dart';
import 'package:simple_location_picker/simple_location_result.dart';
import 'package:simple_location_picker/utils/slp_constants.dart';
import 'package:Weather/screens/Loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yumniastic',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => Loading(),
        // '/weather': (context) => Loading(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SimpleLocationResult _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              RaisedButton(
                child: Text("Display a location"),
                onPressed: () {
                  double latitude = _selectedLocation != null
                      ? _selectedLocation.latitude
                      : SLPConstants.DEFAULT_LATITUDE;
                  double longitude = _selectedLocation != null
                      ? _selectedLocation.longitude
                      : SLPConstants.DEFAULT_LONGITUDE;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SimpleLocationPicker(
                                initialLatitude: latitude,
                                initialLongitude: longitude,
                                appBarTitle: "Display Location",
                                displayOnly: true,
                              )));
                },
              ),
              SizedBox(height: 50),
              RaisedButton(
                child: Text("Pick a Location"),
                onPressed: () {
                  double latitude = _selectedLocation != null
                      ? _selectedLocation.latitude
                      : SLPConstants.DEFAULT_LATITUDE;
                  double longitude = _selectedLocation != null
                      ? _selectedLocation.longitude
                      : SLPConstants.DEFAULT_LONGITUDE;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SimpleLocationPicker(
                                initialLatitude: latitude,
                                initialLongitude: longitude,
                                appBarTitle: "Select Location",
                              ))).then((value) {
                    if (value != null) {
                      setState(() {
                        _selectedLocation = value;
                      });
                    }
                  });
                },
              ),

              SizedBox(height: 50),
              // Displays the picked location on the screen as text.
              _selectedLocation != null
                  ? Text(
                      'SELECTED: (${_selectedLocation.latitude}, ${_selectedLocation.longitude})')
                  : Container(),
            ],
          ),
        ));
  }
}
