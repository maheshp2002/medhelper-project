import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medbuddy/seller/sellerLogin/Screens/welcome_screen.dart';
import 'package:medbuddy/seller/sellerLogin/services/FirebaseService.dart';
import 'package:medbuddy/seller/sellerLogin/utils/constants.dart';

class SellerHomePage extends StatefulWidget {
  SellerHomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SellerHomePage> {
  User user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
                FirebaseService service = new FirebaseService();
                await service.signOutFromGoogle();
                Navigator.of(context).pop(MaterialPageRoute(builder: (ctx) => WelcomeScreen()));
              },
            )
          ],
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.blue),
          title: Text("Home"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(user.email),
            Text(user.displayName),
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL),
              radius: 20,
            )
          ],
        )));
  }
}