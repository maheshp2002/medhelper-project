import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';

class userpublicprofile extends StatefulWidget {
  const userpublicprofile({ Key key}) : super(key: key);

  @override
  DataState createState() => DataState();
}

class DataState extends State<userpublicprofile>{

String dcid;

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
      body: 
      StreamBuilder(
      stream: FirebaseFirestore.instance.collection("UserpublicID").doc(user.email).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

         if (!snapshot.hasData) {
          return Center
          (child:Image.asset("assets/nothing.gif")
     );
        }

        else {


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
          leading: Text("User name:" + " " + snapshot.data['User name'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20),)),

          SizedBox(height: 10,),

          ListTile(leading:
          Text("Age:" + " " + snapshot.data['age'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),),

          SizedBox(height: 10,),


          ListTile(leading:
          Text("Mobile no:" + " " + snapshot.data['mobile no'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20),)),   

          SizedBox(height: 10,),
          
          
          Card(child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(width: 10,),
          Text("Health issues:" + "\n\n" + snapshot.data['issue'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),],)),
          
          SizedBox(height: 20,),

          ]),
          //),                           




    ]);
      
      } }),

    );
  }

}