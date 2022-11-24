import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/Login_ui/Components/Form.dart';
import 'package:medbuddy/Login_ui/Components/SignUpLink.dart';
import 'package:medbuddy/Login_ui/Components/WhiteTick.dart';
import 'package:medbuddy/Login_ui/Components/doctor.dart';
import 'package:medbuddy/Login_ui/Components/forgotpassword.dart';
import 'package:medbuddy/Login_ui/Components/gap.dart';
import 'package:medbuddy/Login_ui/Components/seller.dart';
import 'package:medbuddy/src/ui/login_page/auth_class.dart';
import 'package:medbuddy/src/ui/tabpage/tabs.dart';
import 'package:provider/provider.dart';

import 'styles.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;




class login1 extends StatefulWidget {
  @override
  _loginState createState() => _loginState();

  
}


class _loginState extends State<login1>{


  @override
  Widget build(BuildContext context) {
return MultiProvider(
  providers: [
    Provider<AuthenticationService>(
      create: (_) => AuthenticationService(FirebaseAuth.instance),
    ),

    StreamProvider(create: (context) =>context.read<AuthenticationService>().authStateChange,
     ),
  ],

   child: MaterialApp(
     home: AuthenticationWrapper(),

   ),
);
   } 
}
   
class AuthenticationWrapper extends StatelessWidget{
   AuthenticationWrapper({
    Key key,
  }) : super(key: key);



     @override
     Widget build(BuildContext context){
       final firebaseUser = context.watch<User>();

       if(firebaseUser != null){
         return tab();

       } return LoginScreenState();
     }
}
   

class LoginScreenState extends StatelessWidget {
  AnimationController _loginButtonController;
  var animationStatus = 0;

  //TextEditingController unameController = new TextEditingController();
  //TextEditingController passController = new TextEditingController();





  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  Future<bool> _onWillPop() {
    return showDialog(
          
          builder: (context) {
            return new AlertDialog(
              title: new Text('Are you sure?'),
              actions: <Widget>[
                new TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new TextButton(
                  onPressed: (){
                //context.read<AuthenticationService>().signIn(
        
              //);
              //Navigator.push(
                //context,
                //MaterialPageRoute(builder: (BuildContext context) =>  tab())
        
              //);

            },
                      child: new Text('Yes'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return ( 
    /*Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3EB16F),
        title: Text("Medbuddy"),
        elevation: 0.0,
      ),
    body: */
     new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          body: new Container(
              decoration: new BoxDecoration(
                //image: backgroundImage,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: new Container(
                  //decoration: new BoxDecoration(
                  //     gradient: new LinearGradient(
                  //   colors: <Color>[
                  //     const Color.fromRGBO(162, 146, 199, 0.8),
                  //     const Color.fromRGBO(51, 51, 63, 0.9),
                  //   ],
                  //   stops: [0.2, 1.0],
                  //   begin: const FractionalOffset(0.0, 0.0),
                  //   end: const FractionalOffset(0.0, 1.0),
                  // )
                  //),
                  child: new ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: <Widget>[
                      new Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Tick(image: tick),
                              new FormContainer(),
                              new SignUp(),
                              new reset(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              
                              new Seller(),
  
                              new gap(),
                              
                              new Doctor(),
                              ],)

                            ],
                          ),
                          /*animationStatus == 0
                              ? new Padding(
                                  padding: const EdgeInsets.only(bottom: 50.0),
                                  child: new InkWell(
                                      onTap: () {
                                        setState(() {
                                          animationStatus = 1;
                                        });
                                        _playAnimation();
                                      },
                                      child: new SignIn()),
                                )
                              : new StaggerAnimation(
                                  buttonController:
                                      _loginButtonController.view),
                        ],
                      ),
                    ],
                  ))),*/
        //))
                        ])]))))));
  }
}
