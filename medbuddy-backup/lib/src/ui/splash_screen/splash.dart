import 'package:flutter/material.dart';
import 'package:medbuddy/main.dart';

class Splash extends StatefulWidget {

  _SplashState createState() => _SplashState();
}

  class _SplashState extends State<Splash>{
  @override
  void initState(){
  super.initState();
  _navigatetoHome();
  }

  _navigatetoHome()async{
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => medbuddy()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF3EB16F),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(

        child: Image.asset('assets/splash/medbuddy.png', width:200,height:200),
        ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
            child: Text('MedBuddy',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                fontFamily: "Angel",
                fontSize: 64,
                color: Colors.white,
              ),)
            )
          ),
      ],
        ),
      ),
      ),
    );
}


}




