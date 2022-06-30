import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/Login_ui/Screens/Login/index.dart';
import 'package:medbuddy/global/myColors.dart';
import 'package:medbuddy/global/myDimens.dart';



class resetpass extends StatefulWidget {

  @override
  _reserpassState createState() => _reserpassState();
}

class _reserpassState extends State<resetpass> {

  TextEditingController emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Material(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/forgotpassword image.png', width: 600,height: 350,),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: MyDimens.double_30),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Reset your password",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                          color: Colors.grey,
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
                                          try{
                                        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
                                             Fluttertoast.showToast(  
                                              msg: 'Password reset email send',  
                                              toastLength: Toast.LENGTH_LONG,  
                                              gravity: ToastGravity.BOTTOM,  
                                              //timeInSecForIosWeb: 1,  
                                              backgroundColor: Colors.black,  
                                              textColor: Colors.white  
                                          );
                                          } on FirebaseAuthException catch (e){
                                            print (e);
                                             Fluttertoast.showToast(  
                                              msg: e.message,  
                                              toastLength: Toast.LENGTH_LONG,  
                                              gravity: ToastGravity.BOTTOM,  
                                              //timeInSecForIosWeb: 1,  
                                              backgroundColor: Colors.black,  
                                              textColor: Colors.white  
                                          );
                                          }
                                          Navigator.push(context, 
                                         MaterialPageRoute(builder: (BuildContext context) =>  login1()));                                    
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MyDimens.double_4)),
                                        borderSide: BorderSide(
                                            color: MyColors.lighterPink,
                                            width: MyDimens.double_1),
                                        color: Color.fromARGB(255, 245, 241, 241),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: MyDimens.double_15,
                                              bottom: MyDimens.double_15),
                                          child: Text("Send email",
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
