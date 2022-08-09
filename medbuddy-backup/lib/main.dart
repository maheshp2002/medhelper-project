import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medbuddy/doctor/doctorHome.dart';
import 'package:medbuddy/seller/DataFeed.dart';
import 'package:medbuddy/src/global_bloc.dart';
import 'package:medbuddy/src/ui/splash_screen/splash.dart';
import 'package:medbuddy/Login_ui/Screens/Login/index.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';

//for notification
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', //id
    'High Importance Notification', //title
    'This channel is used for important notification', //description
    importance: Importance.high,
    playSound: true);
//initiallization of flutter notification
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

//initialize firebase app during notification
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up : ${message.messageId}');
}


Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  //Stripe.publishableKey = 'your publish key';

  //await Stripe.instance.applySettings();


  runApp(MyApp2());
}
class medbuddy extends StatefulWidget {
  @override
  _medbuddy createState() => _medbuddy();
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

class _medbuddy extends State<medbuddy> {
  GlobalBloc globalBloc;

  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.blue,
                playSound: true,
                //icon: '@minmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Time to take your medicine as per prescription');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(notification.body)],
                )),
              );
            });
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Tab()));
      }
    });
  }


 
/*
void showNotification(){
  flutterLocalNotificationsPlugin.show(
    0,
    "Time to take your medicine ",
    "as per prescription",
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channel.description,
        importance: Importance.high,
        color: Colors.blue,
        playSound: true,
        icon: '@minmap/ic_launcher'
      )
    )
    );
}*/

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        home: medbuddycheck(),
            //login1(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
class medbuddycheck extends StatelessWidget {
 //SharedPreferences  prefs1;  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: validation(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        //return validate1();
        return snapshot.data;
      }
      return CircularProgressIndicator(); // or some other widget
    },
  );
    
}
validation() async{

    SharedPreferences prefs1 = await SharedPreferences.getInstance(); 
        
     bool doctor = prefs1.getBool('doctor');

     bool seller = prefs1.getBool('seller');


      if(doctor == true){
        return doctorHomePage();

      }else if(seller == true){
        return DataFeed();}

      else{
        return login1();
      }
  
}
}

