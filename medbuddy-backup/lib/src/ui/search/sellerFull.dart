//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/SellerMap.dart';
import 'package:medbuddy/src/ui/search/googleMap.dart';


class SellerFull extends StatefulWidget {

@override
  _DetailedItemState createState() => _DetailedItemState();
}

class _DetailedItemState extends State<SellerFull> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(indexno['medicine name']),
      backgroundColor: Colors.deepPurple,
              leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => sellerMap()),
            );
          },
        ),
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
 //button for navigator              
            Padding(
            padding: EdgeInsets.only(top: 10),
              child: Flexible(
                child: SizedBox(              
                 height: 50,
                 width: 500,
                 child: FlatButton(                  
                splashColor: Colors.white,
                color: Colors.grey[300],
                child: Row (
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Location", textAlign: TextAlign.left,
                  style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                ),
                  ),
           const SizedBox(
            width: 10,
          ),
                  Icon(Icons.location_pin),
                ],
                ),
     onPressed: (){
     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeView()));
    }
    )),     
    )
    ),
      
    ]
  ),),
);
}

}