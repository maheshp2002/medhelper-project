import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/about/about.dart';
import 'package:provider/provider.dart';
import '../login page/auth_class.dart';

class Prescrition extends StatefulWidget {
  @override
  _PrescritionPageState createState() => _PrescritionPageState();
}

class _PrescritionPageState extends State<Prescrition>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFF3EB16F),
        title: Text(
          "Prescription",
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
            Text("Prescription"),

         ])) ));
  }

}



