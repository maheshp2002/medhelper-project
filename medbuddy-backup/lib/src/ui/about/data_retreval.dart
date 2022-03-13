import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/about/dbfull.dart';

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
        backgroundColor: Color(0xFF3EB16F),
       /* actions: [
        IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () {                      
            Navigator.push(
                context,
                MaterialPageRoute(
                builder: (BuildContext context) {
                  return about();
                    }, ),);
                  }, ),],*/
        title: Text(
          "Data Retrival",
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
         
         children: snapshot.data.docs.map((e) => ListTile(
           
           tileColor: Colors.blue,
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.white30),
          ),
             onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => dbfull(),
                  ),);},
           title: Text(e['medicine_name']),)).toList(),
       );
     }
     return Center(child: CircularProgressIndicator(),
     );
     },),

  
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
