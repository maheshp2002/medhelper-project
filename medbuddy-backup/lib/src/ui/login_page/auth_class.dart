import 'package:flutter_restart/flutter_restart.dart';
import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:path_provider/path_provider.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);


  Stream<User> get authStateChange => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    _restartApp();
    _deleteCacheDir();
  }

  Future<String> signIn({String email, String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      //await ;
      //return "Signed in";
     // if (user.isEmailVerified) return user.uid;
                      Fluttertoast.showToast(  
                      msg: 'Signed in',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );  
      //return null;
    } on FirebaseAuthException catch (e){
      //return e.message;
                      Fluttertoast.showToast(  
                      msg: 'Enter valid email and password',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );  

    }

  }

  /*Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
     Fluttertoast.showToast(  
                      msg: 'password reset email send',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );
}*/
  
  
  Future<String> signUp({String email, String password}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        try {
           //await user.sendEmailVerification();   
      //return "Signed up";
                      Fluttertoast.showToast(  
                      msg: 'Signed up',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );
        //return user.uid;

     } catch (e) {
        print("An error occured while trying to send email verification");
        print(e.message);
     } 
                              

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
    /*catch (e){
      return e.message;

    }*/
    
  }
}

//restart app
   void _restartApp() async {
  await FlutterRestart.restartApp();
}

// this will delete cache
Future<void> _deleteCacheDir() async {
final cacheDir = await getTemporaryDirectory();

if (cacheDir.existsSync()) {
cacheDir.deleteSync(recursive: true);
}
}