import 'menu.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'gps.dart';
import 'course.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class db {
  static bool ok;
  static String name = "",
      ID = "",
      code = "",
      hall = "",
      ip = "192.168.43.61",
      qrv;
  static var response,
      convertDataToJson,
      response1,
      convertDataToJson1,
      response2,
      convertDataToJson2,
      coder;
  static int size, att;
  static double maxt, mint, maxl, minl, l, l1, t, t1;

  static void logindb(

      String usermail, String password, BuildContext context) async {
    print("hiiiiiiiiiiiiii" + new DateTime.now().toString().substring(10));

    print("/n/n555555/n" + usermail);
    JsonCodec codec = new JsonCodec();
    response = await http.get(
        Uri.encodeFull("http://" +
            ip +
            "/project/loginF.php?Usermail=" +
            usermail +
            "&Password=" +
            password +
            ""),
        headers: {"Accept": "application/php"});

    var convertDataToJson = codec.decode(response.body);

    if (convertDataToJson == "false") {
      name = "";
      ok = false;
      //  print("\n\n\ntooooooooooz\n\n");
    } else {
      name = convertDataToJson["FName"] + convertDataToJson["LName"];
      ID = convertDataToJson["ID"];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', ID);
      // print("\n\nstate askdjds\n\n\n\n");
      ok = true;
      // print("\n\nn\nstate2 askdjds\n\n");
    }
    if (!ok) {
      error(context, "the login data is not correct");
    }

    if (ok) {
      courses();

      Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
    }
  }

  static error(BuildContext context, String e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              side: BorderSide(
                  width: 1.5,
                  color: Color.fromRGBO(0, 163, 225, 1),
                  style: BorderStyle.solid)),
          title: new Text(
            "Alert",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          content: new Text(
            e,
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static error2(BuildContext context, String e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              side: BorderSide(
                  width: 1.5,
                  color: Color.fromRGBO(0, 163, 225, 1),
                  style: BorderStyle.solid)),
          title: new Text(
            "Alert",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          content: new Text(
            e,
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Menu()));
              },
            ),
          ],
        );
      },
    );
  }

  static login() {
    courses();

    Menu();
  }

  static bool checkgps() {
   // if ((t < maxt && t > mint) && (l < maxl && l > minl) ||
      //  (t1 < maxt && t1 > mint) && (l1 < maxl && l1 > minl))
      return true;
   // else
     // return false;
  }

  static qr(BuildContext context) {
    print("\n\n\n\ninside qr");
  
    t = (MyAppState.lat);
    l = (MyAppState.lon);
    if(t!=null)
    {new QRCodeReader()
        .setAutoFocusIntervalInMs(200)
        .setForceAutoFocus(true)
        .setTorchEnabled(true)
        .setHandlePermissions(true)
        .setExecuteAfterPermissionGranted(true)
        .scan(context);}
  }

  static Future<String> courses() async {
    JsonCodec codec = new JsonCodec();
    print("\n\n\n66666666666666666" + ID);
    response2 = await http.get(
        Uri.encodeFull("http://" + ip + "/project/coursef.php?stu=" + ID + ""),
        headers: {"Accept": "application/php"});
    print(response2.body);

    try {
      convertDataToJson2 = codec.decode(response2.body);
    } on Exception catch (e) {
      print(e.toString());
    }

    if (convertDataToJson2 != false) {
      size = int.tryParse(convertDataToJson2[0][1].toString());
      print("78787878 " + convertDataToJson2.toString());
    }
  }

  static void course(int index, BuildContext context) async {
    JsonCodec codec = new JsonCodec();
    code = convertDataToJson2[1 + index][1].toString();
    hall = convertDataToJson2[1 + index][3].toString();

    response1 = await http.get(
        Uri.encodeFull("http://" + ip + "/project/hallf.php?name=" + hall + ""),
        headers: {"Accept": "application/php"});

    convertDataToJson1 = codec.decode(response1.body);
    maxt = double.parse(convertDataToJson1["maxt"].toString());
    mint = double.parse(convertDataToJson1["mint"].toString());
    maxl = double.parse(convertDataToJson1["maxl"].toString());
    minl = double.parse(convertDataToJson1["minl"].toString());
    print(maxt.toString() + "\n\nhhh\n");
    Navigator.push(context, MaterialPageRoute(builder: (context) => Course()));
  }

  static void insert(BuildContext context) async {
    JsonCodec codec = new JsonCodec();
    coder = QRCodeReader.qr.toString().split("\n");
    print("\n\n\n\ninside qr2");
    print("\n\n\n\ninside qr " + coder[0] + "  " + coder[1]);
    MyAppState.scan(context);
    t1 = (MyAppState.lat);
    l1 = (MyAppState.lon);
    print(coder[0] + code + "hghhgghghghgghhghghg" + maxl.toString());
    if (code == coder[0] && maxl != null) {
      if (checkgps())
        att = 0;
      else {
        att = 1;
        error(context, "you are not attended ,you are out of the hall");
      }

      print("\n" +
          ip +
          "\n" +
          code +
          "\n" +
          ID +
          "\n" +
          coder[1] +
          "\n" +
          new DateTime.now().toString() +
          "\n" +
          t1.toString() +
          "\n" +
          l1.toString() +
          "\n" +
          att.toString());
      var response4 = await http.get(
          Uri.encodeFull("http://" +
              ip +
              "/project/insertf.php?code=" +
              code +
              "&id=" +
              ID +
              "&lec=" +
              coder[1] +
              "&date=" +
              new DateTime.now().toString() +
              "&loc=" +
            t1.toString() +
              "  ^  " +
              l1.toString() +
              "&att=" +
              att.toString() +
              ""),
          headers: {"Accept": "application/php"});
      var check = codec.decode(response4.body);
      if (check == true && att == 0)
        error(context, "you are attended in this lecture");
      else if(check==false && att==0)
        error(context, "you are aleardy  attended in this lecture");


    } else if (code != coder[0])
      error(context, "this qrcode doesnot belong to this course");
    else
      error(context, "open the GPS");
  }

  static void permission(BuildContext context) {}
}
