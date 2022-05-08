import 'package:flutter/material.dart';


class Dillsith extends StatefulWidget {
  @override
  DillsithState createState() => DillsithState();

  
}

class DillsithState extends State<Dillsith>{
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        title: Text(
          "Dilshith",
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
        Image.asset("assets/creatorspic/boy3.png", width: 200,),
        Text("Dillsith T S",style: TextStyle(fontFamily: 'JosefinSans',
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