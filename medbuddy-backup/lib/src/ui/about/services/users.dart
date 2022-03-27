import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
//import 'package:medbuddy/src/ui/homepage/homepage.dart';

class UserManagement{
  storeNewUser(user,context){
    FirebaseFirestore.instance.collection('users').add({'email':user.email,'uid':user.uid})
    .then(((value) =>null 
    //Navigator.push(
      //context, MaterialPageRoute(builder: (context)=>HomePage())
    //)
    ));
  }
}