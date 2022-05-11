import 'package:flutter/material.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:medbuddy/seller/sellerLogin/Screens/sellerProfile.dart';
import 'package:medbuddy/seller/sellerLogin/services/FirebaseService.dart';
import 'package:medbuddy/seller/sellerSettings.dart';
import 'package:medbuddy/src/ui/about/about.dart';
import 'package:shared_preferences/shared_preferences.dart';



class sellerNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'MedHelper',
              style: TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'JosefinSans'),
            ),
            decoration: BoxDecoration(
                color: Color(0xFF3EB16F),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/seller.png"))),
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
            title: const Text('About'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => about()))},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () async {
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
//logout
    logout() async {
    FirebaseService service = new FirebaseService();
    await service.signOutFromGoogle();
    _restartApp();
  
}
//alert
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
           await prefs.setBool('seller', false);                
              logout();  
            },  
          )  
        ],  
      );  
    },  
  );  
}  



