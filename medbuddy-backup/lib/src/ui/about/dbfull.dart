import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/homepage/homepage.dart';

class dbfull extends StatefulWidget {
  @override
    _dbfullState createState() => _dbfullState();
}

class _dbfullState extends State<dbfull> {

@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'Firebase',
	home: AddData(),
	);
}
}

class AddData extends StatelessWidget {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('medicine_name');
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
@override
Widget build(BuildContext context) {
	return Scaffold(

  appBar: AppBar(
        backgroundColor: Color(0xFF3EB16F),
        title: Text(
          "Doc",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),

	body: StreamBuilder(stream: collectionReference.snapshots(),
   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
     if(snapshot.hasData){
       return ListView(
         
         children: snapshot.data.docs.map((doc) => ListTile(
           
           tileColor: Colors.blue,
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.white30),
          ),

           title: Text(doc['time'].toString()),
           subtitle:  Text(doc["dosage"].toString())
           ))
        .toList(),

       );
     }
     return Center(child: CircularProgressIndicator(),
     );
     },),

  
  
	);
}
}
