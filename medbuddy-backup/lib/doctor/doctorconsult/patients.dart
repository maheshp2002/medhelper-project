import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/doctor/doctorconsult/patientdetail.dart';






class patients extends StatefulWidget {
  @override
  _sellerMapageState createState() => _sellerMapageState();
}
var indexnopatients;
String docidpatients;

class _sellerMapageState extends State<patients>{
User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Patients",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body: 
   StreamBuilder(
      stream: FirebaseFirestore.instance.collection(user.email + "patients")
          .orderBy("token", descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if (!snapshot.hasData) {   
          return Center
          (child: 
          Image.asset("assets/nothing.gif")
     );
        }

      else if (snapshot.data?.size == 0) {
        return Center
          (child: Image.asset("assets/nothing.gif"));
        }
        else{
//new streambuilder include image
        
           return ListView(
           children: [
          
            ListView.builder(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,       
                  itemBuilder: (BuildContext context, int index) {
                    return  Card(child:
                    ListTile(
            onLongPress: () async{
            showModalBottomSheet<void>(context: context,
            builder: (BuildContext context) {
            return Container(
            child: new Wrap(
            children: <Widget>[
            new ListTile(
            leading: new Icon(Icons.delete),
            title: new Text('Delete'),
            onTap: () async{              
            await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
            await myTransaction.delete(snapshot.data.docs[index].reference);}
            );              
            },),
            ])
            ); 
            }); 
            },           
            onTap: (){ 
              indexnopatients= snapshot.data.docs[index];
              docidpatients = snapshot.data.docs[index].id;
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => patientdetail()));},


              title: Text("Email ID:" + " " + 
                    snapshot.data.docs[index]['email'],
                    style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                  ),

              subtitle: Text("Token no:" + " " + 
                    snapshot.data.docs[index]['token'].toString(),
                    style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                trailing: Icon(Icons.arrow_forward_ios),

              ));
            
        })
        ],
    
    );

  }})
);


      
  }
}


