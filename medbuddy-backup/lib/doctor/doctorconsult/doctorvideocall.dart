import 'dart:convert';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:medbuddy/doctor/doctorconsult/DCVCbottom/vcNavBar.dart';
import 'package:medbuddy/doctor/doctorconsult/channelInput.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class doctorvideocall extends StatefulWidget {
  const doctorvideocall({Key key}) : super(key: key);

  @override
  State<doctorvideocall> createState() => _MyAppState();
}
PanelController _pc1 = new PanelController();

class _MyAppState extends State<doctorvideocall> {
  AgoraClient client;

 bool _loading = true;

 String tempToken = "";

    


  @override
  void initState() {
    gettoken();
    //initAgora();
    super.initState();
  }

Future<void> gettoken() async{
  
  String link = "https://agora-node-tokenserver.pmahesh2002.repl.co/access_token?channelName=$Dchannelid";
  Response _response = await get(Uri.parse(link));
  Map data = jsonDecode(_response.body);
  //print(data["token"]);
  setState(() {
    tempToken = data["token"];
    print(tempToken);
  });
  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
        appId: "651f5dd558334084b000d24481067768",
        channelName: Dchannelid,
        tempToken: tempToken
        ),
    enabledPermission: [
      Permission.microphone,
      Permission.camera
    ],
  );
  await _client.initialize();
  setState(() {
    client = _client;
    _loading = false;
    print(client);
  });
  //Future.delayed(Duration(seconds: 1)).then((value) => _loading = false);
  
}

  // void initAgora() async {
  //   await _client.initialize();
  // }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: vcNavBar(),
        bottomNavigationBar: bottombar(),
        appBar: AppBar(
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
    
          backgroundColor: Colors.deepPurple,
          title: const Text('MedHelper'),
        ),

      body:  SafeArea(
          child: _loading ? Center(
      
      child: Image.asset('assets/splash/pendulamloading.gif'),) :
          Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                disabledVideoWidget: 
                Container(color: Colors.black,
                  child:
                Center(child:
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset("assets/logo/MH_logo.png"),
                  SizedBox(height: 20,),
                  Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 1),
                  child: Text('MedHelper',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                      fontFamily: "JosefinSans",
                      fontSize: 44,
                      color: Colors.white,
                    ),)
                  )
                ),
                  ]))
                ),
                layoutType: Layout.floating,
                enableHostControls: true, // Add this to enable host controls
              ),
              AgoraVideoButtons(
                client: client,
              ),
        //body: 
        SlidingUpPanel(
          controller: _pc1,
      boxShadow: const <BoxShadow>[BoxShadow(blurRadius: 8.0, color: Color.fromARGB(62, 20, 20, 20))],
       borderRadius: BorderRadius.only(
       topLeft: Radius.circular(18.0),
       topRight: Radius.circular(18.0)),
       // header: Icon(Icons.more_horiz_outlined,color: Colors.black,),
        minHeight: 0,
        maxHeight: 500,
        color: Color.fromARGB(255, 250, 248, 248),
      panel: slideupbar(),)              
            ],
          ),
        //),
      ),
      ),
    );
  }
}

//..........................................................................................................
//bottom bar

class bottombar extends  StatefulWidget {
    @override
  _bottombar createState() => _bottombar();
}

class _bottombar extends State<bottombar> {

    User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
Builder(
          builder: (BuildContext context) {
            return IconButton(

              onPressed: () {
                //nvdocid = snapshot.data['email'];
                //print(nvdocid);
                Scaffold.of(context).openDrawer();
              },
                       
              icon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
            );
  }), 


            IconButton(
              onPressed: () {
                _pc1.open();
                
              },
              icon: const Icon(
                Icons.border_color,
                color: Colors.grey,
              ),
            ),
                       StreamBuilder(
                            stream: FirebaseFirestore.instance.collection("consultDoctors").doc(user.email).snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
            return IconButton(
              onPressed: () async{
                      FirebaseFirestore.instance.collection("consultDoctors").doc(user.email).update({
                      "nextpt": FieldValue.increment(1),
                      });
                      nexttoken++;
              },
              icon: const Icon(
                Icons.add,
                color: Colors.grey,
              ),
            );
                              }

                              else{           
            return IconButton(
              onPressed: () async{
                      FirebaseFirestore.instance.collection("consultDoctors").doc(user.email).update({
                      "nextpt": FieldValue.increment(1),
                      });
                                    Fluttertoast.showToast(  
                                      msg: snapshot.data['nextpt'].toString(),  
                                      toastLength: Toast.LENGTH_LONG,  
                                      gravity: ToastGravity.BOTTOM,  
                                      //timeInSecForIosWeb: 1,  
                                      backgroundColor: Colors.black,  
                                      textColor: Colors.white  
                                  );                       

                      nexttoken++;
              },
              icon: const Icon(
                Icons.add,
                color: Colors.grey,
              ),
            );
                              }}),

          ],
        ),
      );
  }
}


class slideupbar extends  StatefulWidget {

  @override
  _slideupbarState createState() => _slideupbarState();
}

class _slideupbarState extends State<slideupbar> {

  User user = FirebaseAuth.instance.currentUser;
  var collectionref = FirebaseFirestore.instance.collection('consultDoctors');

  String prescription;
  String emailid;
  String date;
  //String name;
   TextEditingController prescriptionController = TextEditingController();
   TextEditingController emailidController = TextEditingController();
   TextEditingController dateController = TextEditingController();
   //TextEditingController nameController = TextEditingController();
  final collectionReference = FirebaseFirestore.instance;

//...........................................................................................
Datepicker() async {
DateTime pickedDate = await showDatePicker(
    context: context, //context of current state
    initialDate: DateTime.now(),
    firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
    lastDate: DateTime(2101)
);

if(pickedDate != null ){
    print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    print(formattedDate); //formatted date output using intl package =>  2021-03-16
}else{
    print("Date is not selected");
}
}
//...........................................................................................

  @override
  Widget build(BuildContext context) {

    return  Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           IconButton(icon: Icon(Icons.arrow_drop_down),
           onPressed: ()=> _pc1.close(),
           ),
           Flexible(
              child:TextField(
                controller: dateController, //editing controller of this TextField
                decoration: InputDecoration( 
                   icon: Icon(Icons.calendar_today), //icon of text field
                   labelText: "Enter Date" //label text of field
                ),
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );
                  
                  if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      date = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      //print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                         dateController.text = date; //set output date to TextField value. 
                      });
                  }else{
                      print("Date is not selected");
                  }
                },
            
          ),
          ),
          SizedBox(
            height: 16,
          ),


            Flexible(
              child:TextField(
              decoration: InputDecoration(
              hintText: "Enter prescription here",
              labelText: "Prescription:",
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
                border: OutlineInputBorder()
            ),
               onChanged: ((value) {
                  prescription = value;
                }),
            controller: prescriptionController,
            keyboardType: TextInputType.multiline,
            maxLines: 30,
          ),),

          SizedBox(
            height: 16,
          ),

            Flexible(
              child:TextField(
              decoration: InputDecoration(
              hintText: "Enter email ID of patient",
              labelText: "Patient EmailID:",
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
                border: OutlineInputBorder()
            ),
               onChanged: ((value) {
                  emailid = value;
                }),
            controller: emailidController,
            keyboardType: TextInputType.emailAddress,
            
          ),),
          Flexible(child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                  width: 220,
                  height: 70,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    shape: StadiumBorder(),
                    child: Center(
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Icon(Icons.send, color: Colors.white),
                      SizedBox(width: 10,),
                      Text(
                        "Send",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),]),
                    ),
                    onPressed: () async{

                      String sign;

                    await collectionReference.doc(user.email).get()
                    .then((snapshot) {
                              sign = snapshot.get('sign');
                            });
                    
                      Fluttertoast.showToast(  
                      msg: 'Prescription Added',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white 
                      ); 

                      //String name;
                      // reg;
                      var collection = FirebaseFirestore.instance.collection('DoctorsValidation');
                        collection.doc(user.email).snapshots().listen((docSnapshot) {
                          if (docSnapshot.exists) {
                            Map<String, dynamic> data = docSnapshot.data();

                            String name = data['Doctor name'];
                            String reg = data['Register no'];
                       collectionReference.collection(emailid).add(
                        {
                        'prescription':prescription,
                        'date':date,
                        'email':user.email,
                        'doctor name': name,
                        'regno': reg,
                        'sign': sign,
                        }, 
                        );

                          }
                        });

                        prescriptionController.clear();
                        emailidController.clear();
                        dateController.clear();
                        }
                        
                        )
                        )),),
          ],
        )
    
    );
}
}