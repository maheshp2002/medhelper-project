import 'package:flutter/material.dart';
import 'package:medbuddy/doctor/signin/doctorSignin.dart';
//import 'package:medbuddy/doctor/signin/signin.dart';



class Doctor extends StatelessWidget {
  Doctor();
  @override
  Widget build(BuildContext context) {
    return new InkWell(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (BuildContext context) =>  DoctorSignInPage()
                //DoctorSignin()
                ));
          },
     child: new Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: new Text(
        "Doctor Login",
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            color: Colors.white60,
            fontSize: 15),
      ),
    ));
  }
}