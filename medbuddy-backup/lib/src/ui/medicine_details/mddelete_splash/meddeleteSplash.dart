import 'package:flutter/material.dart';
import 'package:medbuddy/main.dart';
import 'package:medbuddy/src/ui/tabpage/tabs.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



class MDeleteSplash extends StatefulWidget {

  _SplashState createState() => _SplashState();
}

  class _SplashState extends State<MDeleteSplash>{
      void showNotification(){
  flutterLocalNotificationsPlugin.show(
    0,
    "Medicine deleted",
    "Go back to home screen",
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channel.description,
        importance: Importance.high,
        color: Colors.deepPurple,
        playSound: true,
        //icon: '@minmap/ic_launcher'
      )
    )
    );
}
  @override
  void initState(){
  super.initState();
  _navigatetoHome();
  }

  _navigatetoHome()async{
    await Future.delayed(Duration(milliseconds: 3000), () {});
    showNotification();
    Navigator.pop(context);
    //Navigator.pop(context);
    //Navigator.pop(context);
    //Navigator.push(context, MaterialPageRoute(builder: (context)=> tab()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff252b39),
        //Color(0xFF3EB16F),
        child: Center(


        child: Image.asset('assets/splash/deletemed.gif', width:500,height:500),
        ),
      ),
    );
}


}




