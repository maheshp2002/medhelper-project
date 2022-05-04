import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/SellerMap.dart';

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

        child: Image.asset('assets/review.gif', width:500,height:500),
        ),
      ],
        ),
      ),
      ),
    );
}


}




