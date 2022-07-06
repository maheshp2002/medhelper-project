import 'package:flutter/material.dart';

class buySucess extends StatefulWidget {

  _SplashState createState() => _SplashState();
}

  class _SplashState extends State<buySucess>{
  @override
  void initState(){
  super.initState();
  _navigatetoHome();
  }

  _navigatetoHome()async{
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        //Color(0xFF3EB16F),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(

        child: Image.asset('assets/splash/successsmile.gif', width:500,height:500),
        ),
      ],
        ),
      ),
      ),
    );
}


}




