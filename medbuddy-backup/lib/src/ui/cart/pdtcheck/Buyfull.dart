import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/cart/pdtcheck/Buymap.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';


class buyFull extends StatefulWidget {

@override
  _DetailedItemState createState() => _DetailedItemState();
}

class _DetailedItemState extends State<buyFull> {
//   final isstockempty = FirebaseFirestore.instance.collection("Medicinesell").doc(buydocid);

// var collectionCart = FirebaseFirestore.instance.collection(user.email + "cart");
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(buyindexno['medicine name']),
      backgroundColor: Colors.deepPurple,
              leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
),
  //backgroundColor: Colors.orange[300],
  body: Container(
    
    child: ListView(children: [
      Padding(padding: EdgeInsets.all(10),

    child: Card(
     child: Row(
      children: [
      Image.network(buyindexno['images'], height: 100, width: 100),
      Column(children: [
        Text('Price:' + " " + buyindexno['price']),
        Text('Dosage:' + " " + buyindexno['dosage']),
        Text('Mobile no:' + " " + buyindexno['mobileno'])
      ],),


     ]),

    ),
    ),
      Padding(padding: EdgeInsets.only(top: 10, left: 10),  
     child: Text("Delivery updates:",textAlign: TextAlign.start,
      style: TextStyle(color: Colors.black,fontFamily: 'JosefinSans', fontSize: 30,)),),
      Divider(
        indent: 20,
        endIndent: 20,
        color: Colors.black,
    ), 
    SizedBox(height: 50,),

  StreamBuilder(
      stream:  FirebaseFirestore.instance.collection(user.email + "Productbuy").doc(buydocid).snapshots(),
      builder: (context, snapshot) {
         if (!snapshot.hasData) {
          //hasdata = true;
          return Center
          (child: Text("nothing here")
     );
        }
        

        else{
        int pointA = snapshot.data.get('pointA');
        int pointB = snapshot.data.get('pointB');
        int pointC = snapshot.data.get('pointC');
        int pointD = snapshot.data.get('pointD');
        Color colorA;
        Color colorB;
        Color colorC;
        Color colorD;

        if(pointA == 1){
          colorA = Colors.blue;
        } else{
          colorA = Colors.grey;
        }

        if(pointB == 1){
          colorB = Colors.blue;
        } else{
          colorB = Colors.grey;
        }

        if(pointC == 1){
          colorC = Colors.blue;
        } else{
          colorC = Colors.grey;
        }

        if(pointD == 1){
          colorD = Colors.blue;
        } else{
          colorD = Colors.grey;
        }

   return Column(children: [
     Row(children: [
      SizedBox(width: 10,), 
      Icon(Icons.local_shipping_outlined, color: Colors.blue, size: 40,),
      SizedBox(width: 10,),   
    Text(buyindexno['packed']),]),

    SizedBox(height: 10,),
    Row(children: [
      SizedBox(width: 27,),
    Container(
            width: 5,
            height: 40.0,
            child: Container(
              decoration: new BoxDecoration(
                color: colorA,
                shape: BoxShape.rectangle)
                )),]),

    Row(children: [
      SizedBox(width: 10,),
      CircleAvatar(
        backgroundColor: colorA,),
      SizedBox(width: 10,),  
      Text(buyindexno['reachedA']),      
    ]),

    Row(children: [
      SizedBox(width: 27,),
    Container(
            width: 5,
            height: 40.0,
            child: Container(
              decoration: new BoxDecoration(
                color: colorB,
                shape: BoxShape.rectangle)
                )),]),

    Row(children: [
      SizedBox(width: 10,),
      CircleAvatar(
        backgroundColor: colorB,),
      SizedBox(width: 10,),  
      Text(buyindexno['reachedB']),      
    ]), 

    Row(children: [
      SizedBox(width: 27,),
    Container(
            width: 5,
            height: 40.0,
            child: Container(
              decoration: new BoxDecoration(
                color: colorC,
                shape: BoxShape.rectangle)
                )),]),

    Row(children: [
      SizedBox(width: 10,),
      CircleAvatar(
        backgroundColor: colorC,),
      SizedBox(width: 10,),
      Text(buyindexno['arrival']),      
    ]),


     Row(children: [
      SizedBox(width: 27,),
    Container(
            width: 5,
            height: 40.0,
            child: Container(
              decoration: new BoxDecoration(
                color: colorD,
                shape: BoxShape.rectangle)
                )),]),   

     Row(children: [
      SizedBox(width: 10,), 
      Icon(Icons.check_circle_outline, color: Colors.blue, size: 40,),
      SizedBox(width: 10,),    
     Text(buyindexno['delivered']), ]),  


    ],);
}}),

    ]),
    ),
    );
  }
}

