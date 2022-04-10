import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/homepage/homepage.dart';
import 'package:medbuddy/src/ui/new_entry/new_entry.dart';
import 'package:medbuddy/src/ui/prescription/Prescription.dart';
import 'package:medbuddy/src/ui/search/search.dart';


class tab extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<tab>{

  int slindex = 1;

  @override
  Widget build(BuildContext context) {
  
    //for screens
    final screen = [Prescrition(), HomePage(), search(), NewEntry()];
 
    //for tabs icon
    final items = <Widget>[
      Icon(Icons.book, size: 30, color: Colors.white),
      Icon(Icons.home, size: 30, color: Colors.white),
      Icon(Icons.search, size: 30, color: Colors.white),    
      Icon(Icons.add, size: 30, color: Colors.white),
      
    ];
    return Scaffold(

    //bottom navigation bar
    bottomNavigationBar: CurvedNavigationBar(
      animationDuration: const Duration(milliseconds: 300),
      height: 60,
      items: items,
      backgroundColor: Colors.transparent,
      color: Color(0xFF3EB16F),
      index: slindex,
        onTap: (index) {  
          setState(() {
            slindex = index;
          });
        },
    ),


    body: screen[slindex],
    );

  }
}