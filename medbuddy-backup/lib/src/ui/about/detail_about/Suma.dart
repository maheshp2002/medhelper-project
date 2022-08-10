import 'package:flutter/material.dart';


class Suma extends StatefulWidget {
  @override
  SumaState createState() => SumaState();

  
}

class SumaState extends State<Suma>{
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        title: Text(
          "Suma",
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
        Image.asset("assets/creatorspic/girllogo.png", width: 200,),
        Text("Suma M",style: TextStyle(fontFamily: 'JosefinSans',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,        
        ),),
          const SizedBox(
            height: 30,
          ),  
        Text("- UI designer\n\n- Software tester\n",style: TextStyle(fontFamily: 'JosefinSans',),),     
      ],) 

    ),
));
  }}