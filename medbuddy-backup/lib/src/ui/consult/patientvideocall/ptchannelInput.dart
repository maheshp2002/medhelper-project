import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/src/ui/consult/patientvideocall/patientvideocall.dart';


String Pchannelid;

class Pvideocall extends StatefulWidget {
  Pvideocall({Key key}) : super(key: key);

  @override
  _doctorHomePageState createState() => _doctorHomePageState();
}

class _doctorHomePageState extends State<Pvideocall> {

  String channel;

  //String name;
   TextEditingController channelController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Consult"),
        elevation: 16.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white, 
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            
            );
          },
        ),),

        body:  Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

          SizedBox(
            height: 16,
          ),

TextField(
              decoration: InputDecoration(
              hintText: "channel name",
              labelText: "Channel name:",
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
                border: OutlineInputBorder()
            ),
               onChanged: ((value) {
                  channel = value;
                }),
            controller: channelController,
            keyboardType: TextInputType.multiline,
          ),

 
          SizedBox(
            height: 16,
          ),

          //   Flexible(
          //     child:TextField(
          //     decoration: InputDecoration(
          //     hintText: "username",
          //     labelText: "Username:",
          //     labelStyle: TextStyle(
          //       fontSize: 15,
          //       color: Colors.black
          //     ),
          //       border: OutlineInputBorder()
          //   ),
          //      onChanged: ((value) {
          //         uname = value;
          //       }),
          //   controller: unameController,
          //   keyboardType: TextInputType.emailAddress,
            
          // ),),
          Flexible(child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                  width: 220,
                  height: 70,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    shape: StadiumBorder(),
                    child: Center(
                      child: Text(
                        "Enter",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    onPressed: () async{

                      Pchannelid = channel;
                        
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> patientvideocall()));
                        channelController.clear();
                        }
                        
                        )
                        )),),


          ],
        )));
  }
}
