import 'package:flutter/material.dart';
import 'package:medbuddy/seller/sellerLogin/Screens/welcome_screen.dart';


class Seller extends StatelessWidget {
  Seller();
  @override
  Widget build(BuildContext context) {
    return new InkWell(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (BuildContext context) =>  WelcomeScreen()
                ));
          },
     child: new Padding(
      padding: const EdgeInsets.only(
        top: 30, right: 300,
      ),
      child: new Text(
        "SELLER",
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            color: Colors.black38,
            fontSize: 12.0),
      ),
    ));
  }
}
