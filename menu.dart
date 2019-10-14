import 'package:flutter/material.dart';
import 'api.dart';


class Menu extends StatefulWidget {
  static String tag = 'main page';

  @override
  Menu1 createState() => new Menu1();
}

class Menu1 extends State<Menu> {

  @override
  Widget build(BuildContext context) {

    final title = 'Courses';
try{
    return new Scaffold(
      appBar: AppBar(
        title: Text(title),

      ),
      body:
      ListView.builder(
          itemCount: db.size,
          itemBuilder: (context, index) {
            return  ListTile(

              contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
              leading: Container(

                width: 60.00,
                height: 60.0,
                decoration: new BoxDecoration(

                  image: new DecorationImage(
                    image: new AssetImage('assests/i.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                  border: new Border.all(
                    color: Colors.lightBlue,
                    width: 2.0,
                  ),
                ),
              ),
              title: Text(
                  (db.convertDataToJson2 !=null && db.convertDataToJson2!=false)? db.convertDataToJson2[1+index][0].toString():''),
              subtitle: Text((db.convertDataToJson2 !=null && db.convertDataToJson2!=false)? db.convertDataToJson2[1+index][2].toString():'' ),
              onTap: () {

                db.course(index,context);
              },
            );
          },
        
      ),
    );
  }
  catch(e)
    {
      print(e.toString());
      build(context);
    }
  }
  }