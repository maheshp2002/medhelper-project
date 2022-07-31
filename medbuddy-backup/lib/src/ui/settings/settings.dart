import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/src/ui/about/data_retreval.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Settings>{
  final collectionReference = FirebaseFirestore.instance.collection(user.uid);
  var collectionCart = FirebaseFirestore.instance.collection(user.email + "cart");
  var collectionpdtbuy = FirebaseFirestore.instance.collection(user.email + "Productbuy");

  
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,

      ),
      backgroundColor: Colors.grey[300],

      body: Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
        
        child: Column(
         
          children: <Widget>[  
            Card(
              child: 
                ListTile(
                title: Text('User backup data'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserInformation()));
                },
                 ),
            ),

             Card(
              child: 
                ListTile(
                title: Text('Send Verification mail'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){

                          user.sendEmailVerification();
                      Fluttertoast.showToast(  
                      msg: 'Check out your email inbox',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 

                        }),),

StreamBuilder(
stream: FirebaseFirestore.instance.collection("UserpublicID").doc(user.email).snapshots(),
builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
if (!snapshot.hasData) {
              return Card(
              child: 
                ListTile(
                title: Text('Delete User Account'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
        showModalBottomSheet<void>(context: context,
            builder: (BuildContext context) {
                return Container(
                    child: new Wrap(
                    children: <Widget>[
                        new ListTile(
                        leading: new Icon(Icons.delete),
                        title: new Text('Delete'),
                        onTap: () async{
                          
                          FirebaseFirestore.instance.collection('username').doc(user.uid).delete();

                          try{
                          collectionReference.snapshots().forEach((element) {
                          for (QueryDocumentSnapshot snapshot in element.docs) {
                            snapshot.reference.delete();
                          }});
                          } catch(e){
                            print(e);
                          }



                          try{
                          collectionCart.snapshots().forEach((element) {
                          for (QueryDocumentSnapshot snapshot in element.docs) {
                            snapshot.reference.delete();
                          }});
                          } catch(e){
                            print(e);
                          }

                          try{
                          collectionpdtbuy.snapshots().forEach((element) {
                          for (QueryDocumentSnapshot snapshot in element.docs) {
                            snapshot.reference.delete();
                          }});
                          } catch(e){
                            print(e);
                          }

                          await user?.delete();

                          _restartApp();
                         
                         

                        })
                        ]
                        )
                        );}
                        );
                },
                 ),
                  );                   

             } else{  
             return Card(
              child: 
                ListTile(
                title: Text('Delete User Account'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
        showModalBottomSheet<void>(context: context,
            builder: (BuildContext context) {
                return Container(
                    child: new Wrap(
                    children: <Widget>[
                        new ListTile(
                        leading: new Icon(Icons.delete),
                        title: new Text('Delete'),
                        onTap: () async{

                          FirebaseFirestore.instance.collection('username').doc(user.uid).delete();

                          try{
                          deleteFile(snapshot.data['images']);   

                          await FirebaseFirestore.instance.collection("UserpublicID").doc(user.email).delete();  

                          } catch(e){
                            print(e);
                          }
                        
                          try{
                          collectionReference.snapshots().forEach((element) {
                          for (QueryDocumentSnapshot snapshot in element.docs) {
                            snapshot.reference.delete();
                          }});
                          } catch(e){
                            print(e);
                          }

                          try{
                          collectionCart.snapshots().forEach((element) {
                          for (QueryDocumentSnapshot snapshot in element.docs) {
                            snapshot.reference.delete();
                          }});
                          } catch(e){
                            print(e);
                          }

                           try{
                          collectionpdtbuy.snapshots().forEach((element) {
                          for (QueryDocumentSnapshot snapshot in element.docs) {
                            snapshot.reference.delete();
                          }});
                          } catch(e){
                            print(e);
                          } 

                          await user?.delete();
                          _restartApp();

                                                  
                          //}

                        })
                        ]
                        )
                        );}
                        );
                },
                 ),

    );
    }
    }),
    SizedBox(height: 100),

            Text(
                "Note:- Please delete all order details before deleting account.",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: new TextStyle(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.5,
                    color: Colors.grey,
                    fontSize: 12.0),
              ),
    
    ])) ));
  }

    Future<void> deleteFile(String url) async {
  try {
    await FirebaseStorage.instance.refFromURL(url).delete();
  } catch (e) {
    print("Error deleting db from cloud: $e");
  }
}
}



//restart app
   void _restartApp() async {
  await FlutterRestart.restartApp();
}
