import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:gradution/api.dart';
import 'package:flutter/material.dart';
import 'menu.dart';


class MyAppState  {
  static  Map<String, double> CurrentLocation = new Map();

  static StreamSubscription<Map<String, double>> LocationSubscription;
  static Location location = new Location();
static  double lat,lon;
static String error;



 static Future  scan(BuildContext context) async {
    Map mylocation = <String, double>{};
    try {
      mylocation = await location.getLocation();
      LocationSubscription =
          location.onLocationChanged().listen((Map<String, double> result) {
            CurrentLocation = result;
          });
    } on PlatformException catch (event) {
      if (event.code == "PERMISSION_DENIED") {
        error = "permission denied";
      
      } else if (event.code == "PERMISSION_DENIED_NEVER_ASK") {
        error =
        "permission denied - please ask the user to enable it from the app settings";
      
      }
      mylocation = null;
      db.error2(context, error);
     
    }
    if (mylocation != null) {
      CurrentLocation = mylocation;
      lat = double.parse(CurrentLocation['latitude'].toString());
      lon =  double.parse(CurrentLocation['longitude'].toString());
    }
    else {
      lat = null;
      lon = null;
    }
  }
}