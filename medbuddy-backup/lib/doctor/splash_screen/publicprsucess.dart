import 'package:flutter/material.dart';

class profilesucess extends StatefulWidget {

  _SplashState createState() => _SplashState();
}

  class _SplashState extends State<profilesucess>{
  @override
  void initState(){
  super.initState();
  _navigatetoHome();
  }

  _navigatetoHome()async{
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pop(context);
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

        child: Image.asset('assets/splash/poper.gif', width:500,height:500),
        ),
      ],
        ),
      ),
      ),
    );
}


}




