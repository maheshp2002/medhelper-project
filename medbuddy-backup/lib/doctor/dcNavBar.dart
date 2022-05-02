import 'package:flutter/material.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:medbuddy/doctor/doctorProfile.dart';
import 'package:medbuddy/seller/sellerLogin/services/FirebaseService.dart';
import 'package:medbuddy/src/ui/about/about.dart';


class dcNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    logout() async {
    FirebaseService service = new FirebaseService();
    await service.signOutFromGoogle();
    _restartApp();
  
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
          /*ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => doctorSettings()))},
          ),*/
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('About'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => about()))},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () =>  {
                logout()
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