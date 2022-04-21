
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/homepage/homepage.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/tabpage/tabs.dart';

class patientAbout extends StatefulWidget {
  @override
    patientAboutState createState() => patientAboutState();
}


String prescription;

class patientAboutState extends State<patientAbout> {

@override
Widget build(BuildContext context) {
	return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tab()),
            );
          },
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body: Container(
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

      Text("Email:" + " " + user.email),

    ],)
  
  )
  );
}
}