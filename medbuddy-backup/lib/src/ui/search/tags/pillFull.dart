import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/SellerMap.dart';
import 'package:medbuddy/src/ui/search/googleMap.dart';
import 'package:medbuddy/src/ui/search/tags/Pill.dart';


class pillFull extends StatefulWidget {

@override
  _DetailedItemState createState() => _DetailedItemState();
}

class _DetailedItemState extends State<pillFull> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(indexnopill['medicine name']),
      backgroundColor: Colors.deepPurple,
//               leading: new IconButton(
//           icon: new Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => sellerMap()),
//             );
//           },
//         ),
 ),
  //backgroundColor: Colors.orange[300],
  body: Container(
    
    child: Column(children: [
    Card(
    child: ListTile(
    title:  Text("Dosage:" + " " + indexnopill['dosage']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),  
    Card(
    child: ListTile(              
    title:  Text("Availability:" + " " + indexnopill['availability']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("Address:" + " " + indexnopill['address']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
    Card(
    child: ListTile(                
    title:  Text("Mobile no:" + " " + indexnopill['mobile no']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("Email-id:" + " " + indexnopill['email id']),
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
                  Icon(Icons.location_pin, color: Colors.black),
           const SizedBox(
            width: 150,
          ),
                  Icon(Icons.arrow_forward_ios, color: Colors.black),
                ],
                ),
     onPressed: (){
     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeView()));
    }
    )),     
    )
    
      
    ]
  ),),
);
}

}