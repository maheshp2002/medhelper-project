import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class publicprofileview extends StatefulWidget {
  const publicprofileview({ Key key}) : super(key: key);

  @override
  DataState createState() => DataState();
}

class DataState extends State<publicprofileview>{

User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
         appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title:  const Text("Public profile"),
        elevation: 16.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white, 
              ),
              onPressed: () {
               Navigator.pop(context);
              },            
            );
          },
        ),),     
      body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection("consultDoctors")
     // .where('Did',isEqualTo: user.email)
     .doc(user.email).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        try{
         if (!snapshot.hasData) {
          return Center
          (child: Image.asset("assets/nothing.gif")
     );
        }

        else{

          return 
          ListView(children: [

          Center(child:Image.network(snapshot.data['images'],height: 150, width: 150,)),

          SizedBox(height: 10,),

          Container(
          color: Color.fromARGB(255, 226, 226, 226),
          child: Column(children: [
          Text("Doctor name:" + " " + snapshot.data['doctor name']),

          SizedBox(height: 10,),

          Text("Reg no:" + " " + snapshot.data['regno']),

          SizedBox(height: 10,),

          Text("Specialization:" + " " + snapshot.data['specialization']),

          SizedBox(height: 10,),

          Text("Consult time:" + " " + snapshot.data['consultTime']),

          SizedBox(height: 10,),

          Text("Mobile no:" + " " + snapshot.data['mobile no']),   

          ]),),                           

        ],);

  }
  } catch(e){
          return Center
          (child: Image.asset("assets/nothing.gif")
     );
  }

     }),


 
    );
  }

}