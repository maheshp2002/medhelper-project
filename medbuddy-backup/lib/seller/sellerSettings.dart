import 'package:flutter/material.dart';
import 'package:medbuddy/seller/DataFeed.dart';
import 'package:medbuddy/seller/SellerCloud/SellerMap2.dart';
import 'package:medbuddy/seller/SellerCloud/dltSeller.dart';
import 'package:medbuddy/seller/SellerCloud/updatepdt.dart';



class sellerSettings extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<sellerSettings>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.orange,
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
                
                
            )


         ])) ));
  }

}


