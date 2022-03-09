
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/about/about.dart';

class settings extends StatefulWidget {
  @override
  _settingsPageState createState() => _settingsPageState();
}

class _settingsPageState extends State<settings>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFF3EB16F),
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
        
        child: Row(
         
          children: <Widget>[  
//use sized box to resize button                  
              SizedBox(              
                 height: 50,
                 width: 300,
                child: FlatButton(                  
                splashColor: Colors.lightGreenAccent,
                color: Color(0xFF3EB16F),
                child: Text("About", textAlign: TextAlign.left,
                 style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                ),
                
/*MaterialPageRoute(builder: (context) => const SecondRoute()*/
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => about())
                  );
                },
              ),
              ),
              
        ],
        ),
      ),
      ),
    );
  }

}