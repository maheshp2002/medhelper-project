
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
    
    child: ListView(children: [
      Padding(padding: EdgeInsets.all(10),
     child: Image.network(sindexno['images'],
                height: 300,
                width: 300,
                
         ),),

    Card(
    child: ListTile(
    title:  Text( sindexno['discount %'] + "%",
     style: TextStyle(color: Colors.green, fontSize: 30, fontFamily: 'arvoBold'),),
    )),

//gap btw borders
          const SizedBox(
            height: 16,
          ), 

    Card(
    child: ListTile(
    title:  Text("Discount price:" + " " + sindexno['discount price']),
    )),

//gap btw borders
          const SizedBox(
            height: 16,
          ),

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
    title:  Text("Price:" + " " + sindexno['price']),
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
    Card(
    child: ListTile(               
    title:  Text("Date:" + " " + sindexno['date']),
    )),
//gap btw borders

          const SizedBox(
            height: 16,
          ), 
 //button for navigator              
            Padding(
            padding: EdgeInsets.only(top: 10),
                child: Card(
                  color: Colors.grey[300],
                 child: TextButton(                   
                child: 
                Row (
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
                   Icon(Icons.location_pin, color: Colors.black),
           const SizedBox(
            width: 150,
          ),
                   Icon(Icons.arrow_forward_ios, color: Colors.black),
                ],
                ),
     onPressed: (){
     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SellerHomeView()));
    }
    )),     
    )
    
      
    ]
  ),),
);
}

}