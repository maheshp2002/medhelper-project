import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/about/about.dart';
import 'package:provider/provider.dart';
import '../login page/auth_class.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Settings>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,

      ),
      backgroundColor: Colors.white,

      body: Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
        
        child: Column(
         
          children: <Widget>[  
            Text("Settings"),

         ])) ));
  }

}



