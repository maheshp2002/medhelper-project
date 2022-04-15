import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/sellerFull.dart';


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
        backgroundColor: Color(0xFF3EB16F),

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
     return Center(child: CircularProgressIndicator(),
     );
     },),

  );
	
  
}
}
