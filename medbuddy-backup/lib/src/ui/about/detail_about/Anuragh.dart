import 'package:flutter/material.dart';


class Anuragh extends StatefulWidget {
  @override
  AnuraghState createState() => AnuraghState();

  
}

class AnuraghState extends State<Anuragh>{
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        title: Text(
          "Anuragh",
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
        Image.asset("assets/creatorspic/boy2.png",  width: 200,),
        Text("Anuragh P",style: TextStyle(fontFamily: 'JosefinSans',
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