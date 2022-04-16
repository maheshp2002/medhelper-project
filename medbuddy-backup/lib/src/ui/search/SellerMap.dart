import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/sellerFull.dart';
import 'package:medbuddy/src/ui/tabpage/tabs.dart';


class sellerMap extends StatefulWidget {
  @override
  _sellerMapageState createState() => _sellerMapageState();
}
    var indexno;

class _sellerMapageState extends State<sellerMap>{
    final collectionReference = FirebaseFirestore.instance.collection("Medicinesell").snapshots();
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tab()),
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
                      indexno = snapshot.data.docs[index];
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => SellerFull())
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
