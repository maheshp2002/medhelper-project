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
    color: Colors.white,
    child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/creatorspic/cloud2.png"),
//name      
    ListTile(               
    title:  Text("Name:" + " " + DTindexno['medicine_name'],
     style: TextStyle(color: Colors.black, fontFamily: 'JosefinSansBI')),
    ),
//gap btw borders

          const SizedBox(
            height: 5,
          ), 
 
//dosage
    ListTile(
    title:  Text("Dosage:" + " " + DTindexno['dosage'],
    style: TextStyle(color: Colors.black, fontFamily: 'JosefinSansBI')),
    ),
//gap btw borders
          const SizedBox(
            height: 5,
          ),  
     ListTile(              
    title:  Text("Interval:" + " " + DTindexno['interval'],
    style: TextStyle(color: Colors.black, fontFamily: 'JosefinSansBI')),
    ),
//gap btw borders
          const SizedBox(
            height: 5,
          ), 
    ListTile(               
    title:  Text("Time:" + " " + DTindexno['time'],
    style: TextStyle(color: Colors.black, fontFamily: 'JosefinSansBI')),
    ),


      
    ]
  ),),
);
}

}