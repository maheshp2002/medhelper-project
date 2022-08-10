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
            //Card(
              //child: 
                ListTile(
                title: Text('Data in cloud',style: TextStyle(fontFamily: 'JosefinSansBI')),
                leading: Icon(Icons.cloud_done, color: Colors.black,),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => sellerMap2()));
                },
                 //),

                
                
            ),

            //Card(
              //child: 
                ListTile(
                title: Text('Update product',style: TextStyle(fontFamily: 'JosefinSansBI')),
                leading: Icon(Icons.update, color: Colors.black,),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => updatepdt()));
                },
                 //),
            ),
            //Card(
              //child: 
                ListTile(
                title: Text('Delete a product',style: TextStyle(fontFamily: 'JosefinSansBI')),
                leading: Icon(Icons.delete_forever, color: Colors.black,),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => dltSeller()));
                },
                 //),
                
                
            ),

            // Card(
              //child: 
                ListTile(
                title: Text('Delete account',style: TextStyle(fontFamily: 'JosefinSansBI')),
                leading: Icon(Icons.delete_sweep, color: Colors.black,),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                onTap: () async{
                                showDialog(  
                                    context: context,  
                                    barrierDismissible: false, // user must tap button for close dialog!  
                                    builder: (BuildContext context) {  
                                      return AlertDialog( 
                                        backgroundColor: Colors.grey[200], 
                                        title: Text('Do you want to delete account?',style: TextStyle(fontFamily: 'JosefinSans')),    
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
                                          
  
                                                  },  
                                                )  
                                              ],  
                                            );  
                                          },  
                                        );

                },
                 //),
                
                
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


