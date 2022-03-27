import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/about/data_retreval.dart';

class about extends StatefulWidget {
  @override
  _aboutState createState() => _aboutState();

  
}

class _aboutState extends State<about>{
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Color(0xFF3EB16F),
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
  backgroundColor: Colors.white,

 
  ),
      
    ),
);

  }

}