import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/medicine_webpages/NMC.dart';
import 'package:medbuddy/src/ui/prescription/prescTile.dart';
import 'package:medbuddy/src/ui/tabpage/tabs.dart';
import 'package:url_launcher/url_launcher.dart';

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
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tab()),
            );
          },
        ),
        actions: [
          new IconButton(
          icon: new Icon(Icons.domain_verification),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NMC()),
            );
          },
        ),

        ],
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

          const SizedBox(
            height: 16,
          ),
            Row(children: [
          Icon(Icons.warning_amber_outlined,color: Colors.grey,size: 10,),
          Text("Note: Since there are chances for fake doctors to send prescription",
          style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans',fontSize: 10),),        
            ]),
          Text("always verify if the doctor is real using register number.",
          style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans',fontSize: 10),),
          Text("Click on verify icon in appbar.",
          style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans',fontSize: 10),),             
            const SizedBox(
              height: 10,
            ),

    Card(
    child: ListTile(
    title:  Text("Date: " + " " + preindexno['date']),),),//gap btw borders
          const SizedBox(
            height: 16,
          ),  
    Card(
    child: ListTile(              
    title:  Text("Doctor name: " + " " + preindexno['doctor name']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
    Card(
    child: ListTile(              
    title:  Text("Register no: " + " " + preindexno['regno']),
    trailing: Icon(Icons.arrow_forward_ios),
    onTap: (){
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NMC()),
            );
    },
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),          
    Card(
    child: ListTile(              
    title:  Text("Doctor email: " + " " + preindexno['email']),
    trailing: Icon(Icons.arrow_forward_ios),
    onTap: (){
      _sendingMails();
    },
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),   
    Card(
    child: ListTile(              
    title:  Text("Prescription: " + " " + preindexno['prescription']),
    )),
    ])));
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

_sendingMails()  {
String encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: preindexno['email'],
  query: encodeQueryParameters(<String, String>{
    'subject': 'medhelper'
  }),
);

launchUrl(emailLaunchUri);
}