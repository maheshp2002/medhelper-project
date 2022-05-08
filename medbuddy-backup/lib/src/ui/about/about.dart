import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/about/contact.dart';
import 'package:medbuddy/src/ui/about/detail_about/Anurag.dart';
import 'package:medbuddy/src/ui/about/detail_about/Dillsith.dart';
import 'package:medbuddy/src/ui/about/detail_about/Sarath.dart';
import 'package:medbuddy/src/ui/about/detail_about/Suma.dart';
import 'package:medbuddy/src/ui/about/detail_about/mahesh.dart';


class about extends StatefulWidget {
  @override
  _aboutState createState() => _aboutState();

  
}

class _aboutState extends State<about>{
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
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

    
    child: 
    ListView(
   
    children: <Widget>[
          const SizedBox(
            height: 10,
          ),

                  Text("Creators:", textAlign: TextAlign.left,
                                    style: TextStyle(
                    fontFamily: 'JosefinSans',
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),),

          const SizedBox(
            height: 10,
          ),
                

//Mahesh          

               Card(
                  color: Colors.grey[300],
                 child: TextButton(                  
                child: Row (
                  children: [
               
                  Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Mahesh", textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                ),
                  ),


           const SizedBox(
            width: 160,
          ),
                 Image.asset("assets/creatorspic/boy1.png", width: 70,),
                ],
                ),
     onPressed: (){
     Navigator.push(context, MaterialPageRoute(builder: ((context) => Mahesh())));
    }
    )),     
    
    
//Anurag        
            Padding(
            padding: EdgeInsets.only(top: 10),
                child: Card(
                  color: Colors.grey[300],
                 child: TextButton(                  
                child: Row (
                  children: [
               
                  Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Anurag", textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                ),
                  ),


           const SizedBox(
            width: 160,
          ),
                 Image.asset("assets/creatorspic/boy2.png", width: 70),
                ],
                ),
     onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => Anuragh())));
    }
    )),     
    ), 

 //Dillsith          
            Padding(
            padding: EdgeInsets.only(top: 10),
                child: Card(
                  color: Colors.grey[300],
                 child: TextButton(                  
                child: Row (
                  children: [
               
                  Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Dilshith", textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                ),
                  ),


           const SizedBox(
            width: 170,
          ),
                 Image.asset("assets/creatorspic/boy3.png", width: 70),
                ],
                ),
     onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => Dillsith())));
    }
    )),     
    ),             

 //Suma          
            Padding(
            padding: EdgeInsets.only(top: 10),
                child: Card(
                  color: Colors.grey[300],
                 child: TextButton(                  
                child: Row (
                  children: [
               
                  Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Suma", textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                ),
                  ),


           const SizedBox(
            width: 180,
          ),
                 Image.asset("assets/creatorspic/girllogo.png", width: 70),
                ],
                ),
     onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => Suma())));
    }
    )),     
    ),

//Sarath          
            Padding(
            padding: EdgeInsets.only(top: 10),
                child: Card(
                  color: Colors.grey[300],
                 child: TextButton(                  
                child: Row (
                  children: [
               
                  Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Sarath", textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                ),
                  ),


           const SizedBox(
            width: 170,
          ),
                 Image.asset("assets/creatorspic/boy4.png", width: 70),
                ],
                ),
     onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => Sarath())));
    }
    )),     
    ),
 
Container(alignment: Alignment.bottomCenter,
child: contact()
)      
      ],
    ),
    
  ),
      
    
);

  }

}