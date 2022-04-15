import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/login%20page/register.dart';
import 'package:medbuddy/src/ui/prescription/Prescription.dart';



class prescTile extends StatefulWidget {
  @override
  _prescTilepageState createState() => _prescTilepageState();
}
    var preindexno;

class _prescTilepageState extends State<prescTile>{
    final collectionReference = FirebaseFirestore.instance.collection(user.email).snapshots();
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
  backgroundColor: Colors.grey[200],
	body:  StreamBuilder(stream: collectionReference,
   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
     if(snapshot.hasData){
       return ListView.separated(
         itemBuilder:(BuildContext context, int index) {
           return Column(
              children: snapshot.data.docs.map((doc) {
                return Card(
                  child: ListTile(
                    
                  title: Text(snapshot.data.docs[index]['date']),
                   onTap: (){
                      preindexno = snapshot.data.docs[index];
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => Prescription())
                      );
                    },
                    onLongPress: () {
                      
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
                        })
                        ]
                        )
                        );}
                        );
                    }
                  ),
                );
              }).toList(),
              );
              
              },
               separatorBuilder: (context, index) {
           return Divider(
             color: Colors.white70,
             thickness: 5,
             height: 20,
           );
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