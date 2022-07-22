import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:medbuddy/seller/DataFeed.dart';
import 'package:medbuddy/seller/SellerCloud/SellerMap2.dart';
import 'package:medbuddy/seller/SellerCloud/dltSeller.dart';
import 'package:medbuddy/seller/SellerCloud/updatepdt.dart';
import 'package:medbuddy/seller/sellerLogin/services/FirebaseService.dart';
import 'package:shared_preferences/shared_preferences.dart';



class sellerSettings extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<sellerSettings>{
  
void _restartApp() async {
  await FlutterRestart.restartApp();
}
  logout() async {
    FirebaseService service = new FirebaseService();
    await service.signOutFromGoogle();
    _restartApp();
  
}
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
              MaterialPageRoute(builder: (context) => DataFeed()),
            );
          },
        ),
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
                title: Text('Data in cloud'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => sellerMap2()));
                },
                 ),

                
                
            ),

            Card(
              child: 
                ListTile(
                title: Text('Update product'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => updatepdt()));
                },
                 ),
            ),
            Card(
              child: 
                ListTile(
                title: Text('Delete a product'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => dltSeller()));
                },
                 ),
                
                
            ),

             Card(
              child: 
                ListTile(
                title: Text('Delete account'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () async{
                                        showModalBottomSheet<void>(context: context,
                                        builder: (BuildContext context) {
                                        return Container(
                                        child: new Wrap(
                                        children: <Widget>[
                                        new ListTile(
                                        leading: new Icon(Icons.delete),
                                        title: new Text('Delete'),
                                          onTap: () async{                   
                                        try {
                                          await FirebaseAuth.instance.currentUser.delete();
                                        } catch (e) {
                                          if (e.code == 'requires-recent-login') {
                                            print('The user must reauthenticate before this operation can be executed.');
                                          }
                                        }                                            
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        await prefs.setBool('seller', false);  
                                          
                                        logout();   
                                          
  
                                          })
                                          ])
                                          ); 
                                          }
                                          );

                },
                 ),
                
                
            ),

            Column(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(children: [
                Icon(Icons.warning_amber_outlined,color: Colors.grey, size: 12),
                SizedBox(width: 10),
                Text(
                "Note:- Please delete all order details, products etc.\nbefore deleting account.",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: new TextStyle(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.5,
                    color: Colors.grey,
                    fontSize: 12.0),
              ),
              ]),
            ])           


         ])) ));
  }

}


