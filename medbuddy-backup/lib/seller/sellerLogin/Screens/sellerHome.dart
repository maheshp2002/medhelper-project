/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/seller/sellerLogin/utils/sellerNavBar.dart';



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
       drawer: sellerNavBar(),
        appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text("Home"),
        elevation: 16.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white, 
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            
            );
          },
        ),),
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
}*/