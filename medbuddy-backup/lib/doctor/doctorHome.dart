import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/doctor/dcNavBar.dart';



class doctorHomePage extends StatefulWidget {
  doctorHomePage({Key key}) : super(key: key);

  @override
  _doctorHomePageState createState() => _doctorHomePageState();
}

class _doctorHomePageState extends State<doctorHomePage> {
  String prescription;
  String emailid;
   TextEditingController prescriptionController = TextEditingController();
   TextEditingController emailidController = TextEditingController();
  final collectionReference = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: dcNavBar(),
        appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text("Home"),
        elevation: 16.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white, 
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            
            );
          },
        ),),

        body:  Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

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
              labelText: "Email ID:",
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
                    color: Colors.blue,
                    shape: StadiumBorder(),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    onPressed: () async{
                      Fluttertoast.showToast(  
                      msg: 'Prescription Added',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 
                      await collectionReference.collection(emailid).add(
                        {
                        'prescription':prescription,}, 
                        );
                        prescriptionController.clear();
                        emailidController.clear();
                        }
                        
                        )
                        )),),
          ],
        )));
  }
}