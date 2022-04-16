import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';

class SignUp extends StatelessWidget {
  SignUp();
  @override
  Widget build(BuildContext context) {
    return new InkWell(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (BuildContext context) =>  Register()
                ));
          },
     child: new Padding(
      padding: const EdgeInsets.only(
        top: 80.0,
      ),
      child: new Text(
        "Don't have an account? Sign Up",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: Colors.white,
            fontSize: 12.0),
      ),
    ));
  }
}
