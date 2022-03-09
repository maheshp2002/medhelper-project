
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/medicine_webpages/1mg.dart';
import 'package:medbuddy/src/ui/medicine_webpages/netmeds.dart';
import 'package:medbuddy/src/ui/medicine_webpages/pharmeasy.dart';

class search extends StatefulWidget {
  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<search>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color(0xFF3EB16F),
      elevation: 0.0,
      title: Text(
          "Search",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      
      backgroundColor: Colors.white,

      body: Column(
        children: <Widget>[
//pharmeasy
          Padding(
            padding: EdgeInsets.only(top: 10),
              child: Flexible(
                child: SizedBox(              
                 height: 50,
                 width: 500,
                 child: FlatButton(                  
                splashColor: Colors.lightGreenAccent,
                color: Color(0xFF3EB16F),
                child: Row (children: [
                  Image.asset("assets/logo/pharmeasyl2.png", width: 50),
                  Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("PharmEasy", textAlign: TextAlign.left,
                  style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                ),
                  ),
                ],
                ),
                
/*MaterialPageRoute(builder: (context) => const SecondRoute()*/
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => pharmeasy())
                  );
                },
              ),
                  
                ),
              ),
                
              ),
//netmeds
            Padding(
            padding: EdgeInsets.only(top: 10),
              child: Flexible(
                child: SizedBox(              
                 height: 50,
                 width: 500,
                 child: FlatButton(                  
                splashColor: Colors.lightGreenAccent,
                color: Colors.lightGreen,
                child: Row (children: [
                  Image.asset("assets/logo/netmeds.png", width: 50),
                  Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Netmeds", textAlign: TextAlign.left,
                  style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                ),
                  ),
                ],
                ),
                
/*MaterialPageRoute(builder: (context) => const SecondRoute()*/
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => netmed())
                  );
                },
              ),
                  
                ),
              ),
                
              ),

//1mg
          Padding(
            padding: EdgeInsets.only(top: 10),
              child: Flexible(
                child: SizedBox(              
                 height: 50,
                 width: 500,
                 child: FlatButton(                  
                splashColor: Colors.orange,
                color: Colors.orange,
                child: Row (children: [
                  Image.asset("assets/logo/1mg.png", width: 70, height: 80,),
                  Padding(
                  padding: EdgeInsets.only(left: 1),
                  child: Text("1mg", textAlign: TextAlign.left,
                  style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                ),
                  ),
                ],
                ),
                
/*MaterialPageRoute(builder: (context) => const SecondRoute()*/
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => tatamg())
                  );
                },
              ),
                  
                ),
              ),
                
              ),

        ],
      ),
    );
  }

}