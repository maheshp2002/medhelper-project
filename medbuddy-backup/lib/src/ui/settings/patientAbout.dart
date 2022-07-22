import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/tabpage/tabs.dart';

class patientAbout extends StatefulWidget {
  @override
    patientAboutState createState() => patientAboutState();
}


String prescription;


class patientAboutState extends State<patientAbout> {
 CollectionReference users = FirebaseFirestore.instance.collection('username');
@override
Widget build(BuildContext context) {
	return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tab()),
            );
          },
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body: 

    FutureBuilder<DocumentSnapshot>(
      future: users.doc(user.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data() as Map<String, dynamic>;
          return Center(
          child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Name: ${data['username']}"),
          Text("Email id: " + user.email)
          ],));
        }

        return Center(child: CircularProgressIndicator(color: Colors.deepPurple));
      },
    )
    );
  }
}



//..................................................................................................
