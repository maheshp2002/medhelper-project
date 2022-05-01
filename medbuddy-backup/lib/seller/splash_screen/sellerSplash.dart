import 'package:flutter/material.dart';
import 'package:medbuddy/seller/SellerCloud/SellerMap2.dart';

class sellerSucess extends StatefulWidget {

  _SplashState createState() => _SplashState();
}

  class _SplashState extends State<sellerSucess>{
  @override
  void initState(){
  super.initState();
  _navigatetoHome();
  }

  _navigatetoHome()async{
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sellerMap2()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        //Color(0xFF3EB16F),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(

        child: Image.asset('assets/splash/sucess.gif', width:500,height:500),
        ),
      ],
        ),
      ),
      ),
    );
}


}




