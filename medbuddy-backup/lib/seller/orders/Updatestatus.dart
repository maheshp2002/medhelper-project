
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/seller/orders/ordermap.dart';





class Updatestatus extends StatefulWidget {

@override
  _DetailedItemState createState() => _DetailedItemState();
}

class _DetailedItemState extends State<Updatestatus> {
  User user = FirebaseAuth.instance.currentUser;

final TextEditingController _pointA= TextEditingController();
final TextEditingController _pointB = TextEditingController();
final TextEditingController _pointC = TextEditingController();

String pointA;
String pointB;
String pointC;

int ar;
int pk;
int A;
int B;
int C;
int D;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(orderindexno['medicine name']),
      backgroundColor: Colors.deepPurple,
              leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);}
            ), 
            ),

  //backgroundColor: Colors.orange[300],
  body: Container(
    
    child:  StreamBuilder(
      stream: FirebaseFirestore.instance.collection(orderindexno["email"] + "Productbuy")
      .doc(orderindexno["docid"]).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

        if (!snapshot.hasData) {
                      
            return Center
          (child: Image.asset("assets/nothing.gif"));
        }

        else{
          ar = snapshot.data['ar'];
          pk = snapshot.data['pk'];
          A = snapshot.data['pointA'];
          B = snapshot.data['pointB'];
          C = snapshot.data['pointC'];
          D = snapshot.data['pointD'];
    
    return ListView(children: [

                  Card(
                    child: ListTile(
                      leading: Image.network(snapshot.data['images']),
                      title: Text("Medicine name:" + snapshot.data['medicine name']
                      + "\nPrice:" + snapshot.data['price']
                      + "\nDosage:" + snapshot.data['dosage']
                      ),
                      subtitle: Text("Coustomer name:" + snapshot.data['name']
                      + "\nAddress:" + snapshot.data['address']
                      + "\nAddress2:" + snapshot.data['address2']
                      + "\nPin code:" + snapshot.data['pin']     
                      + "\nMobile no:" + snapshot.data['mobileno']                     
                      ),
                    ),
                    ),

                    SizedBox(height: 20,),
                    Padding(padding: EdgeInsets.only(top: 10, left: 10),  
                    child: Text("Update data:",textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black,fontFamily: 'JosefinSans', fontSize: 30,)),),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.black,
                  ), 
                  SizedBox(height: 50,),

                  Row(children: [
                    SizedBox(width: 10,),
                    Text("Packed:", style: TextStyle(fontSize: 20),),
                    SizedBox(width: 10,),
                    ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple)),
                    onPressed: (){
                      if(pk == 0){
                    FirebaseFirestore.instance.collection(orderindexno["email"] + "Productbuy").doc(orderindexno["docid"]).update({
                        'packed': "Packed. Out to delivery",
                        'pk': 1
                      });
                      } else{

                      Fluttertoast.showToast(  
                      msg: 'Already updated',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 
                      }
                    },
                     child: Text("Yes"))
                  ],),
                  SizedBox(height: 20,),

                  TextField(
                          onChanged: ((value) {
                            pointA= value;
                          }),             
                      controller: _pointA,
                      decoration: const InputDecoration(
                          hintText: "Point location A",
                          labelText: "Reached A:",
                          labelStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black
                          ),
                          border: OutlineInputBorder()
                      ),

                    ),                    
                  
                  SizedBox(height: 10,),
                    ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple)),
                    onPressed: (){
                      if(A==0){
                    FirebaseFirestore.instance.collection(orderindexno["email"] + "Productbuy").doc(orderindexno["docid"]).update({
                        'reachedA': "Reached" + " " + pointA,
                        'pointA': 1
                      });
                      } else{

                      Fluttertoast.showToast(  
                      msg: 'Already updated',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 
                      }

                    },
                     child: Text("Update")),  

                  SizedBox(height: 20,),
 
                  TextField(
                          onChanged: ((value) {
                            pointB= value;
                          }),             
                      controller: _pointB,
                      decoration: const InputDecoration(
                          hintText: "Point location B",
                          labelText: "Reached B:",
                          labelStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black
                          ),
                          border: OutlineInputBorder()
                      ),

                    ),                    
                  
                  SizedBox(height: 10,),
                    ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple)),
                    onPressed: (){
                      if(B==0){
                    FirebaseFirestore.instance.collection(orderindexno["email"] + "Productbuy").doc(orderindexno["docid"]).update({
                        'reachedB': "Reached" + " " + pointB,
                        'pointB': 1
                      });
                      } else{

                      Fluttertoast.showToast(  
                      msg: 'Already updated',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 
                      }                      
                    },
                     child: Text("Update")),  

                  SizedBox(height: 20,),    
 
                  TextField(
                          onChanged: ((value) {
                            pointC= value;
                          }),             
                      controller: _pointC,
                      decoration: const InputDecoration(
                          hintText: "Time",
                          labelText: "Arrival time:",
                          labelStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black
                          ),
                          border: OutlineInputBorder()
                      ),

                    ),                    
                  
                  SizedBox(height: 10,),
                    ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple)),
                    onPressed: (){
                      if(C==0){
                    FirebaseFirestore.instance.collection(orderindexno["email"] + "Productbuy").doc(orderindexno["docid"]).update({
                        'arrival': "Arrive at" + " " + pointC,
                        'pointC': 1
                      });
                      } else{

                      Fluttertoast.showToast(  
                      msg: 'Already updated',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 
                      }                      
                    },
                     child: Text("Update")),  

                  SizedBox(height: 20,), 

                  Row(children: [
                    SizedBox(width: 10,),
                    Text("Delivered:", style: TextStyle(fontSize: 20),),
                    SizedBox(width: 10,),
                     ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple)),
                    onPressed: (){
                      if(D == 0){
                    FirebaseFirestore.instance.collection(orderindexno["email"] + "Productbuy").doc(orderindexno["docid"]).update({
                        'delivered': "delivered",
                        'pointD': 1,
                      });
                      } else{

                      Fluttertoast.showToast(  
                      msg: 'Already updated',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 
                      }                      
                    },
                     child: Text("Update")), ]), 

                  SizedBox(height: 20,),                                        

        ]);

      }})
      
      )
    );

}

}