import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/doctor/doctorHome.dart';



class doctorAbout extends StatefulWidget {
  doctorAbout({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<doctorAbout> {
  User user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("About"),
        elevation: 16.0,
         leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => doctorHomePage()),
            );
          },
        ),
          
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