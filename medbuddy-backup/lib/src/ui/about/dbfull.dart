import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/about/data_retreval.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';

class dbfull extends StatefulWidget {
  @override
    _dbfullState createState() => _dbfullState();
}

class _dbfullState extends State<dbfull> {

@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: AddData(),
	);
}
}

class AddData extends StatelessWidget {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection(user.uid);
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
 @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(DTindexno['medicine_name']),
      backgroundColor: Colors.deepPurple,
              leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserInformation()),
            );
          },
        ),
),
  //backgroundColor: Colors.orange[300],
  body: Container(
    
    child: Column(children: [
//name      
    Card(
    child: ListTile(               
    title:  Text("Name:" + " " + DTindexno['medicine_name']),
    )),
//gap btw borders

          const SizedBox(
            height: 16,
          ), 
 
//dosage
    Card(
    child: ListTile(
    title:  Text("Dosage:" + " " + DTindexno['dosage']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),  
    Card(
    child: ListTile(              
    title:  Text("Interval:" + " " + DTindexno['interval']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("time:" + " " + DTindexno['time']),
    )),


      
    ]
  ),),
);
}

}