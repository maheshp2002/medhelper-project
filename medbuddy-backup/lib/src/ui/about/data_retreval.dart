import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  @override
    _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {

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
		backgroundColor: Colors.green,
		title: Text("data Retrival"),
	),
	body: StreamBuilder(stream: collectionReference.snapshots(),
   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
     if(snapshot.hasData){
       return ListView(
         children: snapshot.data.docs.map((e) => ListTile(title: Text(e['medicine_name']),)).toList(),
       );
     }
     return Center(child: CircularProgressIndicator(),);
     },)
  
  
  /*StreamBuilder(
		stream: FirebaseFirestore.instance.collection('medicine_name').snapshots(),
		builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
		if (!snapshot.hasData) {
			return Center(
			child: CircularProgressIndicator(),
			);
		}

		return ListView(
			children: snapshot.data.docs.map((document) {
			return Container(
				child: Column(
          children: [
          Text(document['medicine_name']),
          Text(document['dosage']),
          Text(document['time'])
        ],),
			);
			}).toList(),
		);
		},
	),*/
	);
}
}
