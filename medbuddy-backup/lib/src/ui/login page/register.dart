import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/Login_ui/Screens/Login/index.dart';
import 'package:medbuddy/global/myColors.dart';
import 'package:medbuddy/global/myDimens.dart';


class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

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
                  hintText: 'example@gmail.com',
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
        
      
             
           /*   Padding(padding: EdgeInsets.only(top: 20),
               child: RaisedButton(
                 color: Colors.pinkAccent,
                 child: Text("Sign In", style: TextStyle(color: Colors.white),),
        onPressed: (){
          context.read<AuthenticationService>().signIn(
            email: EMAILController.text.trim(),
            password: passController.text.trim(),
          );*/


                              /*Container(
                                height: 3 * MyDimens.double_20,
                                constraints: BoxConstraints(
                                    maxWidth: MyDimens.double_600),
                                margin: EdgeInsets.symmetric(
                                    horizontal: MyDimens.double_30,
                                    vertical: MyDimens.double_20),
                                child: CupertinoTextField(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MyDimens.double_15),
                                    decoration: BoxDecoration(
                                        color: MyColors.inputFieldPink,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                MyDimens.double_4))),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                        color: MyColors.lightestPink,
                                       // fontFamily: 'lexenddeca'
                                       ),
                                    controller: emailController,
                                    clearButtonMode:
                                    OverlayVisibilityMode.editing,
                                    keyboardType: TextInputType.emailAddress,
                                    maxLines: 1,
                                    
                                    placeholderStyle: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(fontSize: 18,
                                        color: MyColors.inputFieldTextPink,
                                        //fontFamily: 'lexenddeca'
                                        )),
                              ),

                               Container(
                                height: 3 * MyDimens.double_20,
                                constraints: BoxConstraints(
                                    maxWidth: MyDimens.double_600),
                                margin: EdgeInsets.symmetric(
                                    horizontal: MyDimens.double_30,
                                    vertical: MyDimens.double_20),
                                child: CupertinoTextField(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MyDimens.double_15),
                                    decoration: BoxDecoration(
                                        color: MyColors.inputFieldPink,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                MyDimens.double_4))),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                        color: MyColors.lightestPink,
                                       // fontFamily: 'lexenddeca'
                                       ),
                                    controller: passController,
                                    clearButtonMode:
                                    OverlayVisibilityMode.editing,
                                    keyboardType: TextInputType.text,
                                   
                                    maxLines: 1,
                                    //placeholder: MyStrings.placeholderLoginAuth,
                                    placeholderStyle: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(fontSize: 18,
                                        color: MyColors.inputFieldTextPink,
                                        //fontFamily: 'lexenddeca'
                                        )),
                              ),*/

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
//email signup                  
          /*context.read<AuthenticationService>().signUp(
            email: emailController.text.trim(),
            password: passController.text.trim(),
          );*/
                    try {
                      //UserCredential userCredential = 
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passController.text.trim(),   
                      );                    
                      Fluttertoast.showToast(  
                      msg: 'Signed up',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (BuildContext context) =>  login1()));

                       
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
