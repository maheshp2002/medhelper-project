import 'package:flutter/material.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:medbuddy/seller/sellerLogin/Screens/sellerProfile.dart';
import 'package:medbuddy/seller/sellerLogin/services/FirebaseService.dart';
import 'package:medbuddy/seller/sellerSettings.dart';
import 'package:medbuddy/src/ui/about/about.dart';


class sellerNavBar extends StatelessWidget {
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
          const DrawerHeader(
            child: Text(
              'MedHelper',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Color(0xFF3EB16F),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/pill1.png"))),
          ),
  /*        ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Welcome'),
            onTap: () => {},
          ),*/
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: ((context) => SellerAbout())))}
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => sellerSettings()))},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('about'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => about()))},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
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