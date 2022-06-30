import 'package:flutter/material.dart';
import 'package:medbuddy/Login_ui/Screens/resetpass.dart';

class reset extends StatelessWidget {
  reset();
  @override
  Widget build(BuildContext context) {
    return new InkWell(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (BuildContext context) =>  resetpass()
                ));
          },
     child: new Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
      ),
      child: new Text(
        "Forgot password",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: Colors.grey,
            fontSize: 12.0),
      ),
    ));
  }
}
