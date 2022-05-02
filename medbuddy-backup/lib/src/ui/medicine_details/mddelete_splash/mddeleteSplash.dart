import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/cart/cartmap.dart';
//import 'package:medbuddy/src/ui/homepage/homepage.dart';

class MDSplash extends StatefulWidget {

  _SplashState createState() => _SplashState();
}

  class _SplashState extends State<MDSplash>{
  @override
  void initState(){
  super.initState();
  _navigatetoHome();
  }

  _navigatetoHome()async{
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => cartMap()));
    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        //Color(0xFF3EB16F),
        child: Center(


        child: Image.asset('assets/splash/delete-unscreen.gif', width:500,height:500),
        ),
      ),
    );
}


}




