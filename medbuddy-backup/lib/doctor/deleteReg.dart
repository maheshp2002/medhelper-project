import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/doctor/dcNavBar.dart';
import 'package:medbuddy/global/myColors.dart';
import 'package:medbuddy/global/myDimens.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DeleteReg extends StatefulWidget {
  @override
  DeleteState createState() => DeleteState();

  
}

class DeleteState extends State<DeleteReg>{
  User user1 = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.blue,
        //Color(0xFF3EB16F),
        title: Text(
          "Delete Regester Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
  backgroundColor: Colors.white,

  body: Container(
    alignment: Alignment.center,

    
    child: 
    ListView(
      children: [Column(
        children: [
           const SizedBox(
             height: 80,
           ), 

        Image.asset("assets/delete.png", width: 300,height: 300,),
       
        Text("Want to delete register data?",style: TextStyle(fontFamily: 'JosefinSans',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        ),),
          const SizedBox(
            height: 30,
          ),
         
        Text("Just click on the button below:",style: TextStyle(fontFamily: 'JosefinSans',fontSize: 15),), 
         
          const SizedBox(
            height: 20,
          ), 
                
        Text("- This will log you out",style: TextStyle(fontFamily: 'JosefinSans',fontSize: 15),),      
           
           const SizedBox(
            height: 20,
          ), 

                                     OutlineButton(
                                        onPressed: () async {
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          await prefs.setBool('validation', false);  
                                          await prefs.setBool('doctor', false); 
                                          await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
                                          await myTransaction.delete(
                                            FirebaseFirestore.instance.collection("DoctorsValidation").doc(user1.email));   
                                      });                                         

                                          logout();
                                            
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
                                          child: Text("Delete",
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
            const SizedBox(
            height: 20,
          ),     
      ],),

   ]),
));
  }
}