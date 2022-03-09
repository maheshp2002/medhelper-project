import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/global_bloc.dart';
import 'package:medbuddy/src/ui/login%20page/login.dart';
import 'package:medbuddy/src/ui/splash_screen/splash.dart';
import 'package:medbuddy/src/ui/tabpage/tabs.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class medbuddy extends StatefulWidget {
  @override
  _medbuddy createState() => _medbuddy();
}

class MyApp extends StatelessWidget {
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
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
          brightness: Brightness.light,
        ),
        home: login(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}