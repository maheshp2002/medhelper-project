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
          Text("Hospital address:" + "\n\n" + snapshot.data['Haddress'] + "\n\n" + "", textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
          SizedBox(height: 10,),],)),
          
          SizedBox(height: 10,),         
          
          Card(child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(width: 10,),
          Text("Consult time:" + "\n\n" + snapshot.data['consultTime'] + "\n\n" + "", textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
          SizedBox(height: 10,),],)),
          
          SizedBox(height: 20,),


          ]),
          //),                           
        SizedBox(height: 40,),

        Text("Patients Review:",
        style: TextStyle(color: Colors.black,fontFamily: 'JosefinSans', fontSize: 30,)
        ),

        Divider(
        indent: 5,
        endIndent: 5,
        color: Colors.black,
    ), 

        SizedBox(height: 30,),
    StreamBuilder(
      stream: FirebaseFirestore.instance.collection(user.email + "review")
          .orderBy("rating", descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if (!snapshot.hasData) {
          //hasdata = true;
          return Center
          (child: Text("No rating")
     );
        }
        
        else if (snapshot.data?.size == 0) {

          
            return Center
          (child: Text("No rating",
          style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans', fontSize: 20,))
          );
        }

        else{
                 return ListView.builder(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,

                  itemBuilder: (BuildContext context, int index) {
                  return Card(
                  child: Column(
                  children: [
                  SizedBox(height: 10,),
                    Row(children:[
                  SizedBox(width: 10,),
                  Container(
                  color: Colors.green,
                  child: Row(children: [
                  SizedBox(width: 5,),
                  Text(snapshot.data.docs[index]['rating'],
                  style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans', fontSize: 20,)),
                  SizedBox(width: 5,),
                  Icon(Icons.star,color: Colors.white,size: 15,),
                  SizedBox(width: 5,),
                     ],) ),]),

                  SizedBox(height: 10,),
                  Row(children:[
                  SizedBox(width: 10,),
                  Text("Name:" + " "),
                  Text(snapshot.data.docs[index]['name']),]),

                  SizedBox(height: 30,),
                  Row(children:[
                  SizedBox(width: 10,),
                  Text('Review:'),]),  
                  SizedBox(height: 10,),
                  Container(  alignment: Alignment.topLeft,              
                  child:  Padding(
                    padding: EdgeInsets.all(20), 
                    child:
                  Text(snapshot.data.docs[index]['review']),),)
                  ]),

          
            );
                  });}}),
                              SizedBox(height: 30),         

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