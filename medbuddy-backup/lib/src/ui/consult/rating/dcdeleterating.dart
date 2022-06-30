import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/consult/doctorsr.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';


class dcratingdlt extends StatefulWidget {
  @override
  _sellerMapageState createState() => _sellerMapageState();
}

class _sellerMapageState extends State<dcratingdlt>{
    
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Delete review'),
      backgroundColor: Colors.deepPurple,),
  
  body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection(consultdocid + "review")
          .where('email', isEqualTo: user.email).snapshots(),
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
                  return Padding(padding: EdgeInsets.all(10),
                  child: TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 209, 204, 204))),
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
                  onPressed: (){
                  showModalBottomSheet<void>(context: context,
                  builder: (BuildContext context) {
                    return Container(
                    child: new Wrap(
                    children: <Widget>[
                        new ListTile(
                        leading: new Icon(Icons.delete),
                        title: new Text('Delete'),
                        onTap: () async{
                          double rtng= double.parse(snapshot.data.docs[index]['rating']);
                          await FirebaseFirestore.instance.collection('consultDoctors').doc(consultdocid).set(
                          {
                          'avg': FieldValue.increment(-rtng),
                          'length': FieldValue.increment(-1)
                          },
                          SetOptions(merge: true)
                         
                          );                        
                        await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
                        await myTransaction.delete(snapshot.data.docs[index].reference);}
                        );
                        })
                        ]
                        )
                        );}
                        );                    
                  },

          
            ));
                  });}}),     
                              ); 
  }
}