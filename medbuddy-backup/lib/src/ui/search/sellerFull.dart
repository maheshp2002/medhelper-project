//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/SellerMap.dart';
import 'package:medbuddy/src/ui/search/googleMap.dart';


class SellerFull extends StatefulWidget {

@override
  _DetailedItemState createState() => _DetailedItemState();
}

class _DetailedItemState extends State<SellerFull> {

//GeoPoint geoPoint = indexno['Latitude'];

//....................................................................................................
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(indexno['medicine name'])
),
  //backgroundColor: Colors.orange[300],
  body: Container(
    
    child: Column(children: [
    Card(
    child: ListTile(
    title:  Text("Dosage:" + " " + indexno['dosage']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),  
    Card(
    child: ListTile(              
    title:  Text("Availability:" + " " + indexno['availability']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("Address:" + " " + indexno['address']),
    onTap: (){
      //print(indexno['Latitude'].toString());
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeView()));
    }
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
    Card(
    child: ListTile(                
    title:  Text("Mobile no:" + " " + indexno['mobile no']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("Email-id:" + " " + indexno['email id']),
    )),
//gap btw borders

          const SizedBox(
            height: 16,
          ),      
     // Text(geoPoint.toString()),
    ]),
      
    
  ),
);
}

}