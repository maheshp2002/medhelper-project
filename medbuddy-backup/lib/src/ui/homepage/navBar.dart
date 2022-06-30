import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/about/about.dart';
import 'package:medbuddy/src/ui/cart/cartmap.dart';
import 'package:medbuddy/src/ui/consult/doctorsr.dart';
import 'package:medbuddy/src/ui/login_page/auth_class.dart';
import 'package:medbuddy/src/ui/settings/patientAbout.dart';
import 'package:medbuddy/src/ui/settings/publicprofile/userprofile.dart';
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
              style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'JosefinSans'),
            ),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                //Color(0xFF3EB16F),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/mnav.png"))),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            
            onTap: () async{
              
               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => patientAbout()));},
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('WishList'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => cartMap()))},
          ), 
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Public profile'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => userprofile()))},
          ),              
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Consult'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Home()))},
          ),                  
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Settings()))},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('About'),
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
