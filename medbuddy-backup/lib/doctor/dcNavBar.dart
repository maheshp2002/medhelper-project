import 'package:flutter/material.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:medbuddy/doctor/doctorProfile.dart';
import 'package:medbuddy/doctor/doctorSettings.dart';
import 'package:medbuddy/doctor/doctorconsult/channelInput.dart';
import 'package:medbuddy/doctor/doctorconsult/consultprofile.dart';
import 'package:medbuddy/seller/sellerLogin/services/FirebaseService.dart';
import 'package:medbuddy/src/ui/about/about.dart';
import 'package:shared_preferences/shared_preferences.dart';


class dcNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


  openAlertBox() {
    return showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: Center(
                      child: Text(
                        "Do you want to logout?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(child: 
                      GestureDetector(
                        onTap: () {
                          logout();
                       

               },
                        child: InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.743,
                            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              //Color(0xFF3EB16F),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.0),
                              ),
                            ),
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      ),
                      Flexible(child: 
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.743,
                            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                            decoration: BoxDecoration(
                              color: Colors.red[700],
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30.0)),
                            ),
                            child: Text(
                              "No",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }, context: null);
  }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'MedHelper',
              style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'JosefinSans'),
            ),
            decoration: BoxDecoration(
                color: Color(0xFF3EB16F),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/doc.png"))),
          ),
          /*ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),*/
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => doctorAbout()))},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Public profile'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => consult()))},
          ),  
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Consult'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Dvideocall()))},
          ),                  
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => doctorSettings()))},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('About'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => about()))},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async  {
                final ConfirmAction action = await _asyncConfirmDialog(context);
              },
          ),
        ],
      ),
    );
  }
}

   void _restartApp() async {
  await FlutterRestart.restartApp();
}

    logout() async {
    FirebaseService service = new FirebaseService();
    await service.signOutFromGoogle();
    _restartApp();
  
}

enum ConfirmAction { Cancel, Accept}  
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {  
  return showDialog<ConfirmAction>(  
    context: context,  
    barrierDismissible: false, // user must tap button for close dialog!  
    builder: (BuildContext context) {  
      return AlertDialog( 
        backgroundColor: Colors.grey, 
        title: Text('Do you want to logout?'),    
        actions: <Widget>[  
          FlatButton(  
            child: const Text('Cancel'),  
            onPressed: () {  
              Navigator.of(context).pop(ConfirmAction.Cancel);  
            },  
          ),  
          FlatButton(  
            child: const Text('Logout'),  
            onPressed: () async { 
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('doctor', false); 
              logout();  
            },  
          )  
        ],  
      );  
    },  
  );  
} 