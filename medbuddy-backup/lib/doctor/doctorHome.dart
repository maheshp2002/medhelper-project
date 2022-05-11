import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:medbuddy/doctor/dcNavBar.dart';
import 'package:medbuddy/doctor/splash_screen/doctorSplash.dart';
import 'package:firebase_auth/firebase_auth.dart';


class doctorHomePage extends StatefulWidget {
  doctorHomePage({Key key}) : super(key: key);

  @override
  _doctorHomePageState createState() => _doctorHomePageState();
}

class _doctorHomePageState extends State<doctorHomePage> {
  User user = FirebaseAuth.instance.currentUser;
  String prescription;
  String emailid;
  String date;
  //String name;
   TextEditingController prescriptionController = TextEditingController();
   TextEditingController emailidController = TextEditingController();
   TextEditingController dateController = TextEditingController();
   //TextEditingController nameController = TextEditingController();
  final collectionReference = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
  }
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

 /*             decoration: InputDecoration(
              hintText: "dd/MM/YY",
              labelText: "Date:",
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
                border: OutlineInputBorder()
            ),
               onChanged: ((value) {
                  date = value;
                }),
            controller: dateController,
            keyboardType: TextInputType.datetime,*/
            
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

          // SizedBox(
          //   height: 16,
          // ),

          //  Flexible(
          //     child:TextField(
          //     decoration: InputDecoration(
          //     hintText: "name",
          //     labelText: "Doctor name:",
          //     labelStyle: TextStyle(
          //       fontSize: 15,
          //       color: Colors.black
          //     ),
          //       border: OutlineInputBorder()
          //   ),
          //      onChanged: ((value) {
          //         name = value;
          //       }),
          //   controller: nameController,
          //   keyboardType: TextInputType.name,
            
          // ),),
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
                        }, 
                        );

                          }
                        });

                  
                      

                        
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> doctorSplash()));
                        prescriptionController.clear();
                        emailidController.clear();
                        dateController.clear();
                        }
                        
                        )
                        )),),
          ],
        )));
  }
}
