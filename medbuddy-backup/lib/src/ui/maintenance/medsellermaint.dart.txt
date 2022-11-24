import 'package:flutter/material.dart';

class medsellermaint extends StatefulWidget {
  @override
    _medsellermaintState createState() => _medsellermaintState();
}

class _medsellermaintState extends State<medsellermaint> {
  bool dialogue;

  @override
  void initState() {
    super.initState();
    Future(_showAddDialog);
    }

  _navigatetoHome()async{
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.of(context).pop();
  }



 @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
  body: Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset("assets/creatorspic/development3.gif"),
      SizedBox(height: 10,),

      Text("Under Maintenance", style: TextStyle(fontSize: 20, fontFamily: 'JosefinSansBI')),

      SizedBox(height: 10,),
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Text("This page is currently under maintenace",
       style: TextStyle(fontSize: 15, fontFamily: 'JosefinSans')),       
       ]),

      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Text("and will be back soon.",
       style: TextStyle(fontSize: 15, fontFamily: 'JosefinSans')),]),
    ]),

  )
  );

  }
  _showAddDialog()  async{ 
     await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white70,
          title: Text("Under Maintenance", style: TextStyle(fontSize: 20, fontFamily: 'JosefinSansBI')),
          content: Text("This page is currently under maintenance", style: TextStyle(fontFamily: 'JosefinSans', color: Colors.black,fontWeight: FontWeight.bold)),
          actions: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            FlatButton(
              child: Text("OK",style: TextStyle(fontFamily: 'JosefinSansBI', color: Colors.deepPurple,fontWeight: FontWeight.bold),),
              onPressed: () {
                  _navigatetoHome();
                  Navigator.of(context).pop();
              },
            ),
            ]),

          ],
        ));
  }
}