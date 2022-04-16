import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/about/data_retreval.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Settings>{
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

                
                
            )

         ])) ));
  }

}



