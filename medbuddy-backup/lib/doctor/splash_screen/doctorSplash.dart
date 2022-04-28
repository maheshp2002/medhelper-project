import 'package:flutter/material.dart';
import 'package:medbuddy/doctor/doctorHome.dart';

class doctorSplash extends StatefulWidget {

  _SplashState createState() => _SplashState();
}

  class _SplashState extends State<doctorSplash>{
  @override
  void initState(){
  super.initState();
  _navigatetoHome();
  }

  _navigatetoHome()async{
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => doctorHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(226,243,247,255),
        //Color(0xFF3EB16F),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(

        child: Image.asset('assets/splash/dsucess.gif', width:500,height:500),
        ),
      ],
        ),
      ),
      ),
    );
}


}




