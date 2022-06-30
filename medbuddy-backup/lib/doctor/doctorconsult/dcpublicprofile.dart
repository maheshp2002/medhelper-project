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
          (child:Image.asset("assets/nothing.gif")
     );
        }

        else{

          return 
          ListView(children: [

          Center(child:  Padding(padding: EdgeInsets.only(top: 20, bottom: 10),
          child: 
          Image.network(snapshot.data['images'],height: 300, width: 300, fit: BoxFit.fill,))),

          SizedBox(height: 10,),

          // Container(
          // alignment: Alignment.centerLeft,
          // padding: EdgeInsets.only(left: 10),
          // color: Color.fromARGB(255, 226, 226, 226),
          // child: 
          Column(children: [
          ListTile(
          leading: Text("Doctor name:" + " " + snapshot.data['doctor name'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20),)),

          SizedBox(height: 10,),

          ListTile(leading:
          Text("Reg no:" + " " + snapshot.data['regno'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),),

          SizedBox(height: 10,),

          ListTile(leading: 
          Text("Specialization:" + " " + snapshot.data['specialization'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20),)),

          SizedBox(height: 10,),

          ListTile(leading:
          Text("Mobile no:" + " " + snapshot.data['mobile no'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20),)),   

          SizedBox(height: 10,),
          
          
          Card(child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(width: 10,),
          Text("Consult time:" + "\n\n" + snapshot.data['consultTime'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),],)),
          
          SizedBox(height: 20,),

          ]),
          //),                           

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