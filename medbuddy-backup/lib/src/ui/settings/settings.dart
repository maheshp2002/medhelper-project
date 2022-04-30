import 'package:cloud_firestore/cloud_firestore.dart';
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


             Card(
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
                          await user?.delete();
                          collectionReference.snapshots().forEach((element) {
                          for (QueryDocumentSnapshot snapshot in element.docs) {
                            snapshot.reference.delete();
                          }
                        });
                            _restartApp();

                        })
                        ]
                        )
                        );}
                        );
                },
                 ),

                
                

    )])) ));
  }

}



//restart app
   void _restartApp() async {
  await FlutterRestart.restartApp();
}