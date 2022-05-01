import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/Login_ui/Screens/Login/index.dart';
import 'package:medbuddy/global/myColors.dart';
import 'package:medbuddy/global/myDimens.dart';
import 'package:medbuddy/src/ui/tabpage/tabs.dart';


class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}
final user =  FirebaseAuth.instance.currentUser;
var cred;
class _RegisterState extends State<Register> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Material(
              child: Scaffold(
                backgroundColor: MyColors.primaryColor,
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
                                        'assets/medicine.png'),
                                    fit: BoxFit.cover,
                                  )),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: MyDimens.double_30),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("SignUp new account",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                          color: MyColors.white,
                                          //fontFamily: 'lexenddeca'
                                          )),
                                ),
                              ),

//FOR ENTERING DATA
           Form(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new TextFormField(
                controller: emailController,
               
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 16,
                ),
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                  border: UnderlineInputBorder(),
                ),
    
              ),
              Padding(padding: EdgeInsets.only(top: 10),
               child:
              new TextFormField(
                controller: passController,
                 obscureText: true,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 16,
                ),
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'password',
                  prefixIcon: Icon(Icons.lock),
                  border: UnderlineInputBorder(),
                ),
              ),
              ),              
        
      
             

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
                                         if (emailController.text.isNotEmpty & passController.text.isNotEmpty) {

                    try {
                      //UserCredential userCredential = 
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passController.text.trim(),   
                      ).then((cred) => {
                        cred.user.sendEmailVerification(), 
                        FirebaseFirestore.instance.collection(cred.user.uid).doc().set(
                          {
                        'medicine_name':"0",
                        'dosage':"0", 
                        'time':"0",
                        'interval': "0",
                          }
                        ),
                        FirebaseFirestore.instance.collection(cred.user.email + "cart").doc().set(
                          {
                          'medicine name': "Default value to keep your collection",
                          'email id': 0,
                          'mobile no': 0,
                          'address': 0,
                          'price': 0,
                          'dosage': 0,
                          'discount %': 0,
                          'discount price': 0,
                          'images': 0,

                          }
                        ),                        
                                              
                      }
                      
                       );                   
                      Fluttertoast.showToast(  
                      msg: 'Signed up',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );
                     Fluttertoast.showToast(  
                      msg: 'Verify your email',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (BuildContext context) =>  tab()));

                       
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                            Fluttertoast.showToast(  
                            msg: 'The password provided is too weak.',  
                            toastLength: Toast.LENGTH_LONG,  
                            gravity: ToastGravity.BOTTOM,  
                            //timeInSecForIosWeb: 1,  
                            backgroundColor: Colors.black,  
                            textColor: Colors.white, 
                             ); 
                        
                      } else if (e.code == 'email-already-in-use') {
                             Fluttertoast.showToast(  
                            msg: 'The account already exists for that email.',  
                            toastLength: Toast.LENGTH_LONG,  
                            gravity: ToastGravity.BOTTOM,  
                            //timeInSecForIosWeb: 1,  
                            backgroundColor: Colors.black,  
                            textColor: Colors.white, 
                             ); 
                        
                      }
                    } catch (e) {
                      print(e);
                    }

                        } else {
                          //toast
                            Fluttertoast.showToast(  
                            msg: 'Enter email and password',  
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
                                            color: MyColors.lighterPink,
                                            width: MyDimens.double_1),
                                        color: MyColors.primaryColor,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: MyDimens.double_15,
                                              bottom: MyDimens.double_15),
                                          child: Text("Sign Up",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                  color:
                                                  MyColors.lighterPink,
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
