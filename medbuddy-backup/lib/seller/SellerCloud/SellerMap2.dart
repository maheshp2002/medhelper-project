import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/seller/SellerCloud/sellerFull2.dart';
import 'package:medbuddy/seller/sellerSettings.dart';



class sellerMap2 extends StatefulWidget {
  @override
  _sellerMapageState createState() => _sellerMapageState();
}
var sindexno;

class _sellerMapageState extends State<sellerMap2>{
    final collectionReference = FirebaseFirestore.instance.collection("Medicinesell").snapshots();
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.orange,
        //Color(0xFF3EB16F),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => sellerSettings()),
            );
          },
        ),
        title: Text(
          "Seller Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body:  StreamBuilder(stream: collectionReference,
   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
     if(snapshot.hasData){
       return ListView.separated(
         itemBuilder:(BuildContext context, int index) {
           return Column(
              children: snapshot.data.docs.map((doc) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data.docs[index]['medicine name']),
                    subtitle:  Text(snapshot.data.docs[index]['store name']),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: (){
                      sindexno = snapshot.data.docs[index];
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => SellerFull2())
                      );
                    },
                  ),
                );
              }).toList(),);
              
              },
               separatorBuilder: (context, index) {
           return Divider();
          },
              itemCount: snapshot.data.docs.length,
       );
     }
     return Center(child:
     Text("No medicine found!", style: TextStyle(fontSize: 20,color: Colors.grey),),
     );
     },),

  );
	
  
}
}
