import 'package:flutter/material.dart';
import 'package:medbuddy/seller/sellerLogin/Screens/sign_in_page.dart';
import 'package:medbuddy/src/ui/maintenance/maint.dart';


class Seller extends StatelessWidget {
  Seller();
  @override
  Widget build(BuildContext context) {
    return new InkWell(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (BuildContext context) =>  
                //SignInPage()
                maint()
                ));
          },
     child: new Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: new Text(
        "Seller Login",
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            color: Colors.grey,
            fontSize: 15),
      ),
    ));
  }
}
