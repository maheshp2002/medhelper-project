import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/Login_ui/Components/seller.dart';
import 'package:medbuddy/global/myColors.dart';
import 'package:medbuddy/seller/sellerLogin/Screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import '../../../src/ui/login page/auth_class.dart';
import '../../../src/ui/tabpage/tabs.dart';
import 'styles.dart';
import 'dart:async';
import '../../Components/SignUpLink.dart';
import '../../Components/Form.dart';
import '../../Components/WhiteTick.dart';
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
    return (new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          body: new Container(
              decoration: new BoxDecoration(
                //image: backgroundImage,
                color: MyColors.inputFieldTextPink,
              ),
              child: new Container(
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                    colors: <Color>[
                      const Color.fromRGBO(162, 146, 199, 0.8),
                      const Color.fromRGBO(51, 51, 63, 0.9),
                    ],
                    stops: [0.2, 1.0],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                  )),
                  child: new ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: <Widget>[
                      new Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Seller(),
                              new Tick(image: tick),
                              new FormContainer(),
                              new SignUp()
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
