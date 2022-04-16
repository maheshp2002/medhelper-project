
import 'package:flutter/material.dart';
import 'package:medbuddy/seller/SellerCloud/SellerMap2.dart';
import 'package:medbuddy/seller/SellerCloud/googleMap2.dart';




class SellerFull2 extends StatefulWidget {

@override
  _DetailedItemState createState() => _DetailedItemState();
}

class _DetailedItemState extends State<SellerFull2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(sindexno['medicine name']),
      backgroundColor: Colors.orange,
              leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => sellerMap2()),
            );
          },
        ),
),
  //backgroundColor: Colors.orange[300],
  body: Container(
    
    child: Column(children: [
    Card(
    child: ListTile(
    title:  Text("Dosage:" + " " + sindexno['dosage']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),  
    Card(
    child: ListTile(              
    title:  Text("Availability:" + " " + sindexno['availability']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("Address:" + " " + sindexno['address']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
    Card(
    child: ListTile(                
    title:  Text("Mobile no:" + " " + sindexno['mobile no']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("Email-id:" + " " + sindexno['email id']),
    )),
//gap btw borders

          const SizedBox(
            height: 16,
          ), 
 //button for navigator              
            Padding(
            padding: EdgeInsets.only(top: 10),
              child: Flexible(
                child: Card(
                  color: Colors.grey[300],
                 child: FlatButton(                  
                splashColor: Colors.white,
                child: Row (
                 //mainAxisAlignment: MainAxisAlignment.center,
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
           const SizedBox(
            width: 160,
          ),
                  Icon(Icons.arrow_forward_ios),
                ],
                ),
     onPressed: (){
     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SellerHomeView()));
    }
    )),     
    )
    ),
      
    ]
  ),),
);
}

}