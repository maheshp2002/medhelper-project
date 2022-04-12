import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Prescription extends StatefulWidget {
  @override
    _PrescriptionState createState() => _PrescriptionState();
}


String prescription;

class _PrescriptionState extends State<Prescription> {

@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: AddData(),
	);
}
}

class AddData extends StatelessWidget {
  final collectionReference = FirebaseFirestore.instance.collection("prescription").snapshots();


@override
Widget build(BuildContext context) {
	return 
  
  Scaffold(
  appBar: AppBar(
        backgroundColor: Color(0xFF3EB16F),

        title: Text(
          "Prescription",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body: StreamBuilder(stream: collectionReference,
   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
     if(snapshot.hasData){
       return ListView(
         
         children: snapshot.data.docs.map((e) => ListTile(
           
           tileColor: Colors.blue,
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.white30),
          ),
            /* onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => dbfull(),
                  ),);},*/
           title: Text(e['prescription']),)).toList(),
       );
     }
     return Center(child: CircularProgressIndicator(),
     );
     },),

  );
	
  
}
}


