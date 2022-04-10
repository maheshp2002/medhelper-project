import 'package:flutter/material.dart';
import 'package:medbuddy/seller/sellerLogin/Screens/login_screen.dart';
import 'package:medbuddy/seller/sellerLogin/Screens/sign_in_page.dart';
class WelcomeScreen extends StatelessWidget {

  static const routeName = '/welcome-screen';

  /*
  Widget routeButton(Color buttonColor, String title, Color textColor, BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: buttonColor,
        onPressed: () => context,
        child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: textColor,),),
      ),
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1557683316-973673baf926?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fHw%3D&w=1000&q=80'),
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 25),
                  child: Column(
                    children: [
                      Text('Hello',textAlign: TextAlign.center,
                       style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold, color: Colors.white),),
                      SizedBox(height: 30,),
                      Text('“He who has health has hope; and he who has hope, has everything.”',
                      textAlign: TextAlign.center,
                       style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic, color: Colors.white),),
                       SizedBox(height: 10,),
                        Text(' - Thomas Carlyle',textAlign: TextAlign.center,
                         style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white),),
                    ],
                  ),
                ),),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SignInPage()));
                        },
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                        ),
                        color: Colors.indigo,
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
                      child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                        ),
                        color: Colors.white,
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SignInPage()));
                        },
                        
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
