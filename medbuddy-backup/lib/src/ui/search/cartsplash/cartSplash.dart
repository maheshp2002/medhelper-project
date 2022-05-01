import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/cart/cartmap.dart';

class cartSucess extends StatefulWidget {

  _SplashState createState() => _SplashState();
}

  class _SplashState extends State<cartSucess>{
  @override
  void initState(){
  super.initState();
  _navigatetoHome();
  }

  _navigatetoHome()async{
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => cartMap()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        //Color(0xFF3EB16F),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(

        child: Image.asset('assets/cart1.gif', width:500,height:500),
        ),
      ],
        ),
      ),
      ),
    );
}


}




