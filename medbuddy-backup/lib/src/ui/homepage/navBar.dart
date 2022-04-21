import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/about/about.dart';
import 'package:medbuddy/src/ui/login_page/auth_class.dart';
import 'package:medbuddy/src/ui/settings/patientAbout.dart';
import 'package:medbuddy/src/ui/settings/settings.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'MedHelper',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                //Color(0xFF3EB16F),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/mnav.png"))),
          ),
     /*     ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),*/
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => patientAbout()))},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Settings()))},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('about'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => about()))},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => { context.read<AuthenticationService>().signOut()},
          ),
        ],
      ),
    );
  }
}