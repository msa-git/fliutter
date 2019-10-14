import 'package:flutter/material.dart';
import 'login_page.dart';
import 'menu.dart';
import 'course.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api.dart';
import 'dart:async';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var id  ;
   MyApp()  {run();}
   Future<void> run() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
      id = prefs.getString('id');


   }
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),

    Menu.tag: (context) => Menu(),
    Course.tag: (context) => Course(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gradution',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(


          fontFamily: 'Nunito'
      ),
      home:id==null? LoginPage():db.login(),
    );
  }
}