import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  var collectionreference = FirebaseFirestore.instance.collection("consultDoctors");
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
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
 Row(mainAxisAlignment: MainAxisAlignment.center,
  children: [  
                              OutlineButton( 
                                onPressed: () async {
                                        showModalBottomSheet<void>(context: context,
                                        builder: (BuildContext context) {
                                        return Container(
                                        child: new Wrap(
                                        children: <Widget>[
                                        new ListTile(
                                        leading: new Icon(Icons.delete),
                                        title: new Text('Delete'),
                                          onTap: () async{                                        

                                          await FirebaseFirestore.instance.collection("DoctorsValidation").doc(user1.email).delete();    
                                            SharedPreferences prefs = await SharedPreferences.getInstance();
                                          await prefs.setBool('validation', false);  
                                          await prefs.setBool('doctor', false); 

                                          logout();                                          
                                          },
                                        ),
                                                    ])
                                                    ); 
                                                    });  },
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
                                         showModalBottomSheet<void>(context: context,
                                        builder: (BuildContext context) {
                                        return Container(
                                        child: new Wrap(
                                        children: <Widget>[
                                        new ListTile(
                                        leading: new Icon(Icons.delete),
                                        title: new Text('Delete'),
                                          onTap: () async{                                            
                                          deleteFile(snapshot.data['images']);

                                          await FirebaseFirestore.instance.collection("consultDoctors").doc(user1.email).delete();   
                                          await FirebaseFirestore.instance.collection("DoctorsValidation").doc(user1.email).delete();          
                                          
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          await prefs.setBool('validation', false);  
                                          await prefs.setBool('doctor', false); 
                                          logout();
                                          try{
                                          await FirebaseFirestore.instance.collection(user1.email + "review").snapshots().forEach((element) {
                                          for (QueryDocumentSnapshot snapshot in element.docs) {
                                            snapshot.reference.delete();
                                          }});   }
                                          catch(e){
                                            print(e);
                                          } 
                                          
                                          
                                  
 
                                        },
                                                                                ),
                                      ])
                                       ); 
                                       });  },
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
            height: 20,
          ),     
      ],),

   ]),
));
  }
    Future<void> deleteFile(String url) async {
  try {
    await FirebaseStorage.instance.refFromURL(url).delete();
  } catch (e) {
    print("Error deleting db from cloud: $e");
  }
}
}