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
        color: Colors.white,
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
        
        child: Column(
         
          children: <Widget>[  
            //card(
              //child: 
                ListTile(
                leading: Icon(Icons.cloud_done, color: Colors.black,),
                title: Text('User backup data', style: TextStyle(fontFamily: 'JosefinSansBI'),),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserInformation()));
                },
                 ),
            //),

            // Card(
              //child: 
                ListTile(
                leading: Icon(Icons.mark_email_read, color: Colors.black,),
                title: Text('Send Verification mail',style: TextStyle(fontFamily: 'JosefinSansBI'),),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                onTap: (){

                      user.sendEmailVerification();
                      Fluttertoast.showToast(  
                      msg: 'Check out your email inbox',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 

                        }),
                        //),

StreamBuilder(
stream: FirebaseFirestore.instance.collection("UserpublicID").doc(user.email).snapshots(),
builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
if (!snapshot.hasData) {
              return 
              //Card(
              //child: 
                ListTile(
                leading: Icon(Icons.delete_forever, color: Colors.black,),
                title: Text('Delete User Account', style: TextStyle(fontFamily: 'JosefinSansBI')),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
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
                 //),
                  );                   

             } else{  
             return 
            // Card(
              //child: 
                ListTile(
                leading: Icon(Icons.delete_sweep, color: Colors.black,),
                title: Text('Delete User Account', style: TextStyle(fontFamily: 'JosefinSansBI')),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                onTap: (){
                                showDialog(  
                                    context: context,  
                                    barrierDismissible: false, // user must tap button for close dialog!  
                                    builder: (BuildContext context) {  
                                      return AlertDialog( 
                                        backgroundColor: Colors.grey[200], 
                                        title: Text('Do you want to delete user account?',style: TextStyle(fontFamily: 'JosefinSans')),    
                                        actions: <Widget>[  
                                          FlatButton(  
                                            child: const Text('Cancel',style: TextStyle(fontFamily: 'JosefinSans')),  
                                            onPressed: () {  
                                              Navigator.of(context).pop(context);  
                                            },  
                                          ),  
                                          FlatButton(  
                                            child: const Text('Delete',style: TextStyle(fontFamily: 'JosefinSans')),  
                                            onPressed: () async { 

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

                              },  
                            )  
                          ],  
                        );  
                      },  
                    ); 
                },
                // ),

    );
    }
    }),
    SizedBox(height: 20),
            Text(
                "Note:- Please delete all order details in MedSeller before deleting account.",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: new TextStyle(fontFamily: 'JosefinSansBI',
                    color: Colors.grey,
                    fontSize: 10.0),
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
