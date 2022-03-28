import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/about/dbfull.dart';

class UserInformation extends StatefulWidget {
  @override
    _UserInformationState createState() => _UserInformationState();
}

User loggedInUser;
String medname;
String dosage;
String interval;
String time;

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
  //CollectionReference  
  final collectionReference = FirebaseFirestore.instance.collection('medicine_name').snapshots();


@override
Widget build(BuildContext context) {
	return 
  
  Scaffold(
  appBar: AppBar(
        backgroundColor: Color(0xFF3EB16F),

        title: Text(
          "Data Retrival",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body: 
 Center(child: FutureBuilder(
   future: fetch(),
    builder: (context, snapshot) {
     if (snapshot.connectionState != ConnectionState.done)
        return Text("Loading");
      return Column(children: [
        Text("medicine_name : $medname"),
        Text("dosage : $dosage"),
        Text("interval: $interval"),
        Text("time: $time"),
  ],
      );
    }
    ),
    )
  


  /* StreamBuilder(stream: collectionReference//.snapshots()
  ,
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
     },),*/

  );
	
  
}
}
fetch() async{
  final firebaseUser = await FirebaseAuth.instance.currentUser;
  if(firebaseUser != null){
  await FirebaseFirestore.instance
  .collection('medicine_name')
  .doc(firebaseUser.uid)
  .get()
  //.then((data) async {
   //var dataReceive 
   //medname = data['medicine_name'];
   //return medname;
  // });
  .then((ds){
    medname = ds.data()["medicine_name"];
    dosage = ds.data()["dosage"];
    interval = ds.data()["interval"];
    time = ds.data()["time"];
    }
  ).catchError((e){
print(e);
  }
  );
    }
  }

