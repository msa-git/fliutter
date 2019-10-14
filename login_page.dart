import 'package:flutter/material.dart';
import 'api.dart';
import 'gps.dart';


class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  LoginPageState createState() => new LoginPageState();
}



class LoginPageState extends State<LoginPage> {

double t1,l1;
final _mail =TextEditingController();
final _pass =TextEditingController();
@override
void dispose(){
  _mail.dispose();
  _pass.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {




    final login = FractionallySizedBox(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 40.0, color: Colors.white),
        ),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: BorderDirectional(
                bottom: BorderSide(
                  width: 4.0,
                  color: Color.fromRGBO(0, 163, 225, 1),
                  style: BorderStyle.solid,
                ))),
        height: 60.0,
      ),
      widthFactor: 0.5,

    );

    final email = TextFormField(

      cursorColor: Color.fromRGBO(0, 163, 225, 1),
     controller: _mail,
      keyboardType: TextInputType.emailAddress,
      autofocus: true,

      style: TextStyle(color: Colors.white, fontSize: 20.0),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
          child: Icon(
            Icons.people,
            color: Colors.white,
          ), // icon is 48px widget.
        ),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(
            width: 5.0, color: Color.fromRGBO(0, 163, 225, 1)),
            borderRadius: BorderRadius.all(Radius.circular(2.01))),
        hintText: 'Email',
        hintStyle:
        TextStyle(fontSize: 16.0, color: Color.fromRGBO(217, 217, 217, 1)),
      ),
    );
    final password = TextFormField(
     controller: _pass,
      autofocus: false,
      style: TextStyle(color: Colors.white, fontSize: 20.0),
      obscureText: true,
      decoration: InputDecoration(

        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
          child: Icon(
            Icons.lock,
            color: Colors.white,
          ), // icon is 48px widget.
        ),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(
            width: 5.0, color: Color.fromRGBO(0, 163, 225, 1)),
            borderRadius: BorderRadius.all(Radius.circular(2.01))),
        border: UnderlineInputBorder(borderSide: BorderSide(
            color: Color.fromRGBO(0, 163, 225, 1),
            width: 2.0,
            style: BorderStyle.solid)),
        hintText: 'Passowrd ',
        hintStyle:
        TextStyle(fontSize: 16.0, color: Color.fromRGBO(179, 179, 179, 1)),
      ),
    );

    final loginButton = Padding(

      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Color.fromRGBO(0, 163, 225, 1))),

        onPressed: () {

    MyAppState.scan(context);

         db.logindb(_mail.text, _pass.text, context);

        },
        padding: EdgeInsets.all(10),
        color: Color.fromRGBO(0, 0, 0, 0),
        child: Text('sign in',
            style: TextStyle(color: Colors.white, fontSize: 22.0)),
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          body: new Stack(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assests/a.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 60.0, right: 54.0, top: 60.0),
                  children: <Widget>[
                    login,
                    SizedBox(
                      height: 25.0,
                    ),
                    email,
                    SizedBox(
                      height: 8.0,
                    ),
                    password,
                    SizedBox(
                      height: 24.0,
                    ),
                    loginButton
                  ],
                ),
              ),
            ],
          )),
    );
  }}