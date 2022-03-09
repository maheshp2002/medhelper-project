import 'package:flutter/cupertino.dart';
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
          "About",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
  backgroundColor: Colors.white,

  body: Container(
    alignment: Alignment.center,
    child: Padding(
    padding: EdgeInsets.only(top: 40),
    child: 
    Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[

          Flexible( 
          child: Text(
            "Anurag",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: "Angel"
          ),
          ),
          ),
          Flexible( 
          child: Text(
            "Dilsith",
          style: TextStyle(
            color: Colors.black,
            fontSize: 38,
            fontFamily: "Angel"
          ),
          ),
          ),
          Flexible( 
          child: Text(
            "Suma",
          style: TextStyle(
            color: Colors.black,
            fontSize: 38,
            fontFamily: "Angel"
          ),
          ),
          ),
          Flexible( 
          child: Text(
            "Mahesh",
          style: TextStyle(
            color: Colors.black,
            fontSize: 38,
            fontFamily: "Angel"
          ),
          ),
          ),
                    Flexible( 
          child: Text(
            "Sarath",
          style: TextStyle(
            color: Colors.black,
            fontSize: 38,
            fontFamily: "Angel"
          ),
          ),
          ),
          ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return UserInformation();
                          },
                        ),
                      
                          
                    );

                  },
                  child: Text("submit data"),

                ),
      ],
    ),
    
  ),
      
    ),
);

  }

}