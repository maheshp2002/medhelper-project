import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:medbuddy/doctor/doctorconsult/doctorvideocall.dart';
import 'package:medbuddy/doctor/doctorconsult/patients.dart';
import 'package:uuid/uuid.dart';


String Dchannelid;
int nexttoken;

class Dvideocall extends StatefulWidget {
  Dvideocall({Key key}) : super(key: key);

  @override
  _doctorHomePageState createState() => _doctorHomePageState();
}

class _doctorHomePageState extends State<Dvideocall> {
  final TextEditingController _limit = TextEditingController();

  User user = FirebaseAuth.instance.currentUser;

  String uname;
  int limit;
  String channel;
  String _meetingcode = "abcdefqw";

  //String name;
   TextEditingController channelController = TextEditingController();
   //TextEditingController unameController = TextEditingController();
  @override
  void initState() {
    var uuid = Uuid();
    _meetingcode = uuid.v1().substring(0, 8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Consult"),
        elevation: 16.0,
        leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white, 
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              
        ),
        ),

        body:  Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

          SizedBox(
            height: 16,
          ),

          //   TextField(
          //    
          //     decoration: InputDecoration(
          //     hintText: "channel name",
          //     labelText: "Channel name:",
          //     labelStyle: TextStyle(
          //       fontSize: 15,
          //       color: Colors.black
          //     ),
          //       border: OutlineInputBorder()
          //   ),
          //      onChanged: ((value) {
          //         channel = value;
          //       }),
          //   controller: channelController,
          //   keyboardType: TextInputType.multiline,
          // ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),
            child: ListTile(
              leading: Icon(Icons.link, color: Colors.grey,),
              title: SelectableText(
                _meetingcode,
                style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
              ),
              trailing: Icon(Icons.copy),
              onTap: (){
                Clipboard.setData(ClipboardData(text: _meetingcode));
                     Fluttertoast.showToast(  
                      msg: 'copied',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );  
              }
            )
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
           StreamBuilder(
                            stream: FirebaseFirestore.instance.collection("consultDoctors").doc(user.email).snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return Center
                                (child: CircularProgressIndicator(color: Colors.deepPurple)
                                //Image.asset("assets/nothing.gif")
                          );
                              }

                              else{        
          return Flexible(child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                  width: 220,
                  height: 70,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    shape: StadiumBorder(),
                    child: Center(
                      child: Text(
                        "+ New meeting",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    onPressed: () async{

                      Dchannelid = _meetingcode;

                      FirebaseFirestore.instance.collection("consultDoctors").doc(user.email).update({
                      "nextpt": FieldValue.increment(1),
                      });
                      //int tokens = ;
                      
                      nexttoken = snapshot.data['nextpt'] + 1;
                        
                      FirebaseFirestore.instance.collection("consultDoctors").doc(user.email).update({
                      "vccode": _meetingcode,
                      });                   
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> doctorvideocall()));
                        channelController.clear();
                        //unameController.clear();
                        }
                        
                        )
                        )),
                        );
           }}),

          Flexible(child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                  width: 270,
                  height: 50,
                  child: OutlineButton(
                    color: Colors.deepPurple,
                    shape: StadiumBorder(),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(Icons.share, color: Colors.grey),
                          SizedBox(width: 10,),
                          Text(
                        "share meeting code",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                        ]),
                    ),
                    onPressed: share,
                        
                        )
                        )),),

                  SizedBox(height: 10,),                  

                  Card(child:
                  ListTile(
                    title: Text('Patients'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> patients()));
                    },
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),),

                  SizedBox(height: 10,),

                  Column(mainAxisAlignment: MainAxisAlignment.end, 
                  children: [
                      StreamBuilder(
                            stream: FirebaseFirestore.instance.collection("consultDoctors").doc(user.email).snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return Center
                                (child: CircularProgressIndicator(color: Colors.deepPurple)
                                //Image.asset("assets/nothing.gif")
                          );
                              }

                              else{
                                try{
                                return Column(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Text("Next patient:"),

                                  SizedBox(width: 5,),

                                  ElevatedButton(
                                    style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 224, 224, 224))
                                    ),                                      
                                    child: Text(snapshot.data['nextpt'].toString(), style: TextStyle(color: Colors.black),),),
                                    
                                  ElevatedButton(
                                    style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 224, 224, 224))
                                    ),                                      
                                    child: Icon(Icons.add, color: Colors.black,),
                                    onPressed: () async{

                                      FirebaseFirestore.instance.collection("consultDoctors").doc(user.email).update({
                                        "nextpt": FieldValue.increment(1),
                                      });

                                    },
                                    ),

                                    SizedBox(width: 10,),

                                  ElevatedButton(
                                    style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple)
                                    ),  
                                    onPressed: () async{

                                      FirebaseFirestore.instance.collection("consultDoctors").doc(user.email).update({
                                        "nextpt": 0,
                                      });

                                    },                                                                      
                                    child: Text("Reset",
                                     style: TextStyle(color: Colors.white),),
                                    ),

                                  ]),
                                  SizedBox(height: 10,),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 224, 224, 224))
                                    ),                                    
                                    child: Text("No. of token:" + " " + snapshot.data["token"].toString(),
                                     style: TextStyle(color: Colors.black),),
                                    ),

                                    SizedBox(width: 10,),

                                  ElevatedButton(
                                    style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple)
                                    ),  
                                    onPressed: () async{

                                      FirebaseFirestore.instance.collection("consultDoctors").doc(user.email).update({
                                        "token": 0,
                                      });

                                    },                                                                      
                                    child: Text("Reset",
                                     style: TextStyle(color: Colors.white),),
                                    ),                                    

                                    ],),
                                  SizedBox(height: 10,),

                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Text("Token limit:"),

                                  SizedBox(width: 5,), 

                                  SizedBox(
                                    width: 30.0,
                                    child: TextField(
                                    onChanged: ((value) {
                                      limit = int.parse(value);
                                    }),            
                                    controller: _limit,
                                    decoration: InputDecoration(
                                      hintText: snapshot.data['limit'].toString(),
                                  ),
                                  keyboardType: TextInputType.number,
                                    ),
                                  ),

                                  SizedBox(width: 5,), 

                                  ElevatedButton(
                                    style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple)
                                    ), 
                                    onPressed: () async{

                                      FirebaseFirestore.instance.collection("consultDoctors").doc(user.email).update({
                                        "limit": limit,
                                      });
                                      Fluttertoast.showToast(  
                                      msg: 'Limit set',  
                                      toastLength: Toast.LENGTH_LONG,  
                                      gravity: ToastGravity.BOTTOM,  
                                      //timeInSecForIosWeb: 1,  
                                      backgroundColor: Colors.black,  
                                      textColor: Colors.white  
                                  ); 
                                  _limit.clear();

                                    },                                                                          
                                    child: Text("Enter",
                                     style: TextStyle(color: Colors.black),),
                                    ), 
                                  ]),                                   
                                ],);
                                

                            }
                      catch(e) {
                      return Text("No public profile", style: TextStyle(color: Colors.grey));
                    }}

                              }),
                  ],)
          ],
        )));
  }
    Future<void> share() async {
    await FlutterShare.share(
        title: 'Here is your channel code for doctor consult VC',
        text: _meetingcode,
        //linkUrl: 'https://flutter.dev/',
        //chooserTitle: 'Example Chooser Title'
        );
  }
}

