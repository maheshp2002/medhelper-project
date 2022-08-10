import 'package:flutter/material.dart';
import 'package:medbuddy/doctor/deleteReg.dart';
import 'package:medbuddy/doctor/doctorHome.dart';
import 'package:medbuddy/doctor/doctorconsult/dconsult.dart';




class doctorSettings extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<doctorSettings>{
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
              MaterialPageRoute(builder: (context) => doctorHomePage()),
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
                title: Text('Create public Profile',style: TextStyle(fontFamily: 'JosefinSansBI')),
                leading: Icon(Icons.delete_sweep, color: Colors.black,),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                onTap: () async{
                    {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => publicprofile()));

                }
  }),
  
                ListTile(
                title: Text('Delete Register data',style: TextStyle(fontFamily: 'JosefinSansBI')),
                leading: Icon(Icons.delete_sweep, color: Colors.black,),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                onTap: () async{
                    {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DeleteReg()));

                }
  }),
                
                
            //)

         ])) ));
  }

}


