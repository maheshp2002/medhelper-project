import 'package:flutter/material.dart';

class rateingSucess extends StatefulWidget {

  _SplashState createState() => _SplashState();
}

  class _SplashState extends State<rateingSucess>{
  @override
  void initState(){
  super.initState();
  _navigatetoHome();
  }

  _navigatetoHome()async{
    await Future.delayed(Duration(milliseconds: 7000), () {});
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFfd3769),
        //Color(0xFF3EB16F),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(

        child: Image.asset('assets/splash/smileloading.gif', width:500,height:500),
        ),
      ],
        ),
      ),
      ),
    );
}


}




