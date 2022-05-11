import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/doctor/doctorHome.dart';
import 'package:medbuddy/global/myColors.dart';
import 'package:medbuddy/global/myDimens.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Doctorval extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Doctorval> {
  User user = FirebaseAuth.instance.currentUser;
  TextEditingController regController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String name;
  String reg;

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Material(
              child: Scaffold(
                backgroundColor: MyColors.white,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  left: MyDimens.double_30,
                                  right: MyDimens.double_30,
                                  top: MyDimens.double_25 * 2,
                                ),
                                child: Column(
                                  children: <Widget>[  
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: MyDimens.double_30,
                                      vertical: MyDimens.double_30),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/verification.png'),
                                    fit: BoxFit.cover,
                                  )),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: MyDimens.double_30),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Enter Validation Details",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                          color: MyColors.grey,
                                          //fontFamily: 'lexenddeca'
                                          )),
                                ),
                              ),

//FOR ENTERING DATA
           Form(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              Padding(padding: EdgeInsets.only(top: 10),
               child:
              new TextFormField(
                controller: nameController,
               onChanged: ((value) {
                  name = value;
                }),
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 16,
                ),
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.keyboard),
                  border: UnderlineInputBorder(),
                ),
    
              ),),

              Padding(padding: EdgeInsets.only(top: 10),
               child:
              new TextFormField(
                controller: regController,
               onChanged: ((value) {
                  reg = value;
                }),                
                 //obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 16,
                ),
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Register number',
                  prefixIcon: Icon(Icons.lock),
                  border: UnderlineInputBorder(),
                ),
              ),
              ),              
        

  
//.................................................................................          

                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: MyDimens.double_30,
                                    vertical: MyDimens.double_10),
                                constraints: BoxConstraints(
                                    maxWidth: MyDimens.double_600),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: OutlineButton(
                                        onPressed: () async {
                                         if (regController.text.isNotEmpty & nameController.text.isNotEmpty) {

                   
                         
                          
                        FirebaseFirestore.instance.collection("DoctorsValidation").doc(user.email).set(
                          {
                        'Doctor name':name,
                        'Register no':reg, 
                        
                          }

                        );
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('validation', true);
                        //print(Validation);
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (BuildContext context) =>  doctorHomePage()));


                        } else {
                          //toast
                            Fluttertoast.showToast(  
                            msg: 'Enter name and register number',  
                            toastLength: Toast.LENGTH_LONG,  
                            gravity: ToastGravity.BOTTOM,  
                            //timeInSecForIosWeb: 1,  
                            backgroundColor: Colors.black,  
                            textColor: Colors.white  
                        );  

                                          }

                                        },

                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MyDimens.double_4)),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(255, 151, 234, 255),
                                            width: MyDimens.double_1),
                                        color: Color.fromARGB(255, 151, 234, 255),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: MyDimens.double_15,
                                              bottom: MyDimens.double_15),
                                          child: Text("Submit",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                  color:
                                                  Color.fromARGB(255, 151, 234, 255),
                                                  //fontFamily:
                                                 // 'lexenddeca'
                                                 )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
           ),
                        ],
                      ),
                        ],
                    ),
                  ),
                ),
              ),          
                ),
    );
  }
}
