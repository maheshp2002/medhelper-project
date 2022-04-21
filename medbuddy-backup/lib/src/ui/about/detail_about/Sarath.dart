import 'package:flutter/material.dart';


class Sarath extends StatefulWidget {
  @override
  SarathState createState() => SarathState();

  
}

class SarathState extends State<Sarath>{
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        title: Text(
          "Sarath",
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

    
    child: 
    Container(
      alignment: Alignment.center,
      child: Column(children: [
          const SizedBox(
            height: 150,
          ),         
        Image.asset("assets/creatorspic/boy4.png", width: 200,),
        Text("Sarath S" ,style: TextStyle(fontFamily: 'JosefinSans',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        ),),
          const SizedBox(
            height: 30,
          ),  
        Text("- Developer\n\n- Programmer\n\n- Designer",style: TextStyle(fontFamily: 'JosefinSans',),),     
      ],) 

    ),
));
  }}