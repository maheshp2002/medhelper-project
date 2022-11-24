import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  var collectionreference = FirebaseFirestore.instance.collection("consultDoctors");
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        title: Text(
          "Delete Register Data",
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
 Row(mainAxisAlignment: MainAxisAlignment.center,
  children: [  
                              OutlineButton( 
                                onPressed: () async {                                 
                                Fluttertoast.showToast(  
                                msg: 'If you have created a public profile, then delete it first..!',  
                                toastLength: Toast.LENGTH_LONG,  
                                gravity: ToastGravity.BOTTOM,  
                                backgroundColor: Colors.black,  
                                textColor: Colors.white  
                                );  
                                showDialog(  
                                    context: context,  
                                    barrierDismissible: false, // user must tap button for close dialog!  
                                    builder: (BuildContext context) {  
                                      return AlertDialog( 
                                        backgroundColor: Colors.grey[200], 
                                        title: Text('Do you want to delete register data?',style: TextStyle(fontFamily: 'JosefinSans')),    
                                        actions: <Widget>[  
                                          FlatButton(  
                                            child: const Text('Cancel',style: TextStyle(fontFamily: 'JosefinSans')),  
                                            onPressed: () {  
                                              Navigator.of(context).pop(context);  
                                            },  
                                          ),  
                                          FlatButton(  
                                            child: const Text('Delete',style: TextStyle(fontFamily: 'JosefinSans')),  
                                          onPressed: () async { 
                                          try{
                                          await FirebaseFirestore.instance.collection("DoctorsValidation").doc(user1.email).delete();    
                                            SharedPreferences prefs = await SharedPreferences.getInstance();
                                          await prefs.setBool('validation', false);  
                                          await prefs.setBool('doctor', false); 

                                          Fluttertoast.showToast(  
                                          msg: 'Register data deleted',  
                                          toastLength: Toast.LENGTH_LONG,  
                                          gravity: ToastGravity.BOTTOM,  
                                          //timeInSecForIosWeb: 1,  
                                          backgroundColor: Colors.black,  
                                          textColor: Colors.white 
                                          );                                          

                                        try {
                                          await FirebaseAuth.instance.currentUser.delete();
                                        } catch (e) {
                                          if (e.code == 'requires-recent-login') {
                                            print('The user must reauthenticate before this operation can be executed.');
                                          }
                                        }                                              
                                          Fluttertoast.showToast(  
                                          msg: 'Account deleted successfully!',  
                                          toastLength: Toast.LENGTH_LONG,  
                                          gravity: ToastGravity.BOTTOM,  
                                          backgroundColor: Colors.black,  
                                          textColor: Colors.white  
                                        );                                                                                   
                                        logout();   

                                        } catch(e) {
                                           Navigator.of(context).pop();

                                            Fluttertoast.showToast(  
                                            msg: 'Unable to delete your account',  
                                            toastLength: Toast.LENGTH_LONG,  
                                            gravity: ToastGravity.BOTTOM,  
                                            //timeInSecForIosWeb: 1,  
                                            backgroundColor: Colors.black,  
                                            textColor: Colors.white  
                                            );  
                                          }                                       
                                          },  
                                        )  
                                      ],  
                                    );  
                                  },  
                                ); 
                                                    
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
                                          child: Text("Delete account",
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
            width: 20,
          ),          
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection("consultDoctors")
              // .where('Did',isEqualTo: user.email)
              .doc(user1.email).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

        

                                    return OutlineButton(
                                        onPressed: () async {
                                showDialog(  
                                    context: context,  
                                    barrierDismissible: false, // user must tap button for close dialog!  
                                    builder: (BuildContext context) {  
                                      return AlertDialog( 
                                        backgroundColor: Colors.grey[200], 
                                        title: Text('Do you want to delete public profile?',style: TextStyle(fontFamily: 'JosefinSans')),    
                                        actions: <Widget>[  
                                          FlatButton(  
                                            child: const Text('Cancel',style: TextStyle(fontFamily: 'JosefinSans')),  
                                            onPressed: () {  
                                              Navigator.of(context).pop(context);  
                                            },  
                                          ),  
                                          FlatButton(  
                                            child: const Text('Delete',style: TextStyle(fontFamily: 'JosefinSans')),  
                                            onPressed: () async {     
                                          try{                                      
                                          deleteFile(snapshot.data['images']);
                                          deleteFile(snapshot.data['sign']);

                                          await FirebaseFirestore.instance.collection("consultDoctors").doc(user1.email).delete();   
                                          await FirebaseFirestore.instance.collection("DoctorsValidation").doc(user1.email).delete();          
                                          
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          await prefs.setBool('validation', false);  
                                          await prefs.setBool('doctor', false); 

                                          Fluttertoast.showToast(  
                                          msg: 'Profile deleted',  
                                          toastLength: Toast.LENGTH_LONG,  
                                          gravity: ToastGravity.BOTTOM,  
                                          //timeInSecForIosWeb: 1,  
                                          backgroundColor: Colors.black,  
                                          textColor: Colors.white 
                                          ); 

                                          Fluttertoast.showToast(  
                                          msg: "If you didn't logout, just click on delete account button",  
                                          toastLength: Toast.LENGTH_LONG,  
                                          gravity: ToastGravity.BOTTOM,  
                                          //timeInSecForIosWeb: 1,  
                                          backgroundColor: Colors.black,  
                                          textColor: Colors.white 
                                          ); 
                                          
                                          try{
                                          await FirebaseFirestore.instance.collection(user1.email + "review").snapshots().forEach((element) {
                                          for (QueryDocumentSnapshot snapshot in element.docs) {
                                            snapshot.reference.delete();
                                          }});  }
                                          catch(e){
                                            print(e);
                                          } 


                                        try {
                                          await FirebaseAuth.instance.currentUser.delete();
                                        } catch (e) {
                                          if (e.code == 'requires-recent-login') {
                                            print('The user must reauthenticate before this operation can be executed.');
                                          }
                                        }     
                                        Fluttertoast.showToast(  
                                            msg: 'Public profile deleted successfully',  
                                            toastLength: Toast.LENGTH_LONG,  
                                            gravity: ToastGravity.BOTTOM,  
                                            //timeInSecForIosWeb: 1,  
                                            backgroundColor: Colors.black,  
                                            textColor: Colors.white  
                                        );                                      
                                          logout();
                                          } catch(e){
                                            Navigator.of(context).pop();

                                            Fluttertoast.showToast(  
                                            msg: 'No public profile',  
                                            toastLength: Toast.LENGTH_LONG,  
                                            gravity: ToastGravity.BOTTOM,  
                                            //timeInSecForIosWeb: 1,  
                                            backgroundColor: Colors.black,  
                                            textColor: Colors.white  
                                        );  
                                        }
 
                                        },  
                                                )  
                                              ],  
                                            );  
                                          },  
                                        );
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
                                          child: Text("Delete public profile",
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
                                      );  
  
                                        }),
  
 ]),
         const SizedBox(
            height: 10,
          ), 
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children:[
          Icon(Icons.warning_amber_outlined, color: Colors.grey, size: 15,),

          SizedBox(width: 5,),

        Text("If you have created a public profile, then delete it first.",style: TextStyle(fontFamily: 'JosefinSans',fontSize: 10, color: Colors.grey),),        
        ]),
            const SizedBox(
            height: 20,
          ),     
      ],),

   ]),
));
  }
//    void _restartApp() async {
//   await FlutterRestart.restartApp();
// }

    Future<void> deleteFile(String url) async {
  try {
    await FirebaseStorage.instance.refFromURL(url).delete();
  } catch (e) {
    print("Error deleting db from cloud: $e");
  }
}
}