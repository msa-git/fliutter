import 'api.dart';
import 'package:flutter/material.dart';
import 'gps.dart';
class Course extends StatefulWidget {
  static String tag = 'Course';


  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<Course> {



  @override
  Widget build(BuildContext context) {
MyAppState.scan(context);
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Course Name'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //notification
          children: <Widget>[
            new Text(MyAppState.lat!=null?MyAppState.lat.toString():''),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {

          db.qr(context);

        },
        tooltip: 'Reader the QRCode',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }
}
