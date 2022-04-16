import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/login%20page/register.dart';
import 'package:medbuddy/src/ui/prescription/prescTile.dart';

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
  final collectionReference = FirebaseFirestore.instance.collection(user.email).snapshots();

 @override
Widget build(BuildContext context) {

 
	return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),

        title: Text(
          "Prescription",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body: Container(
    
    child: Column(children: [
    Card(
    child: ListTile(
    title:  Text(preindexno['date']),),),
//gap btw borders
          const SizedBox(
            height: 16,
          ),  
    Card(
    child: ListTile(              
    title:  Text(preindexno['prescription']),
    )),])));
}}
       
       
/*

        showModalBottomSheet<void>(context: context,
            builder: (BuildContext context) {
                return Container(
                    child: new Wrap(
                    children: <Widget>[
                        new ListTile(
                        leading: new Icon(Icons.delete),
                        title: new Text('Delete'),
                        onTap: () =>*/