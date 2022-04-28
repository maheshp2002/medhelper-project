import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/seller/SellerCloud/sellerFull2.dart';
import 'package:medbuddy/seller/sellerSettings.dart';
import 'package:medbuddy/src/ui/search/tags/Bottle.dart';
import 'package:medbuddy/src/ui/search/tags/Pill.dart';
import 'package:medbuddy/src/ui/search/tags/Syringe.dart';
import 'package:medbuddy/src/ui/search/tags/Tablet.dart';



class sellerMap2 extends StatefulWidget {
  @override
  _sellerMapageState createState() => _sellerMapageState();
}
var sindexno;


class _sellerMapageState extends State<sellerMap2>{
    //final collectionReference = FirebaseFirestore.instance.collection("Medicinesell").snapshots();
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.orange,
        //Color(0xFF3EB16F),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => sellerSettings()),
            );
          },
        ),
        title: Text(
          "Seller Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body:  StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Medicinesell")
      .limit(12)
          .orderBy("medicine name", descending: false).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if (!snapshot.hasData) {
          return Center
          (child: Image.asset("assets/nothing.gif")
     );
        }
        else if (snapshot.data?.size == 0) {

          
            return Center
          (child: Image.asset("assets/nothing.gif"));
        }

        else{

//new streambuilder include image
        return  ListView(
          children: [
 //.......................................................................................................
 //top bar 
      Padding(padding: EdgeInsets.only(top: 60, left: 10),  
     child: Text("Categories:",textAlign: TextAlign.start,
      style: TextStyle(color: Colors.black,fontFamily: 'JosefinSans', fontSize: 30,)),),
      Divider(
        indent: 20,
        endIndent: 20,
        color: Colors.black,
    ),      

      Padding(padding: EdgeInsets.all(10),            
            child: Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
              child: Row(children: [
              Text("Pill",textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans')),
              SizedBox(width: 5,),
              Icon(Icons.bookmark,color: Colors.white),
              ],),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> pill()));
              }
              ),

              SizedBox(width: 5,),

             TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
              child: Row(children: [
              Text("Syringe",textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans')),
              SizedBox(width: 5,),
              Icon(Icons.bookmark,color: Colors.white),
              ]),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> syringe()));
              }            
              ),  

            SizedBox(width: 5,),

            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
              child: Row(children: [
              Text("Tablet",textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans')),
              SizedBox(width: 5,),
              Icon(Icons.bookmark,color: Colors.white),
              ]),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> tablet()));
              }          
              ),

              SizedBox(width: 5,),    

             TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
              child: Row(children: [
              Text("Bottle",textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans')),
              SizedBox(width: 5,),
              Icon(Icons.bookmark,color: Colors.white),
              ]),
               onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> bottle()));
              }             
              )
                                
              
              ]),),


      Padding(padding: EdgeInsets.only(left: 10, top: 20),  
     child: Text("Products",textAlign: TextAlign.start,
      style: TextStyle(color: Colors.black,fontFamily: 'JosefinSans', fontSize: 30,)),),
      Divider(
        indent: 20,
        endIndent: 20,
        color: Colors.black,
    ),
 //.......................................................................................................
             GridView.builder(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return   Material(
                color: Color.fromARGB(255, 204, 248, 219),
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: (){
                      sindexno = snapshot.data.docs[index];
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => SellerFull2()));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(child: 
                      Image.network(snapshot.data.docs[index]['images'],
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      ),
                      SizedBox(height: 6,),
                      Flexible(child: 
                      Text(snapshot.data.docs[index]['medicine name'],textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black38,fontFamily: 'JosefinSans'),
                      ),),
                      Flexible(child: 
                      Text(snapshot.data.docs[index]['discount %'],textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green),
                      ),),                      
                    ],
                  ),
                ),
              
                      

                    );
                    
                  },

        )]
        );
      }}

    ));
  }}
       
  
  
  //....................................................................................................
  
  /*StreamBuilder(stream: collectionReference,
   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
     if(snapshot.hasData){
       return ListView.separated(
         itemBuilder:(BuildContext context, int index) {
           return Column(
              children: snapshot.data.docs.map((doc) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data.docs[index]['medicine name']),
                    subtitle:  Text(snapshot.data.docs[index]['store name']),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: (){
                      sindexno = snapshot.data.docs[index];
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => SellerFull2())
                      );
                    },
                  ),
                );
              }).toList(),);
              
              },
               separatorBuilder: (context, index) {
           return Divider(
             color: Colors.grey,
             thickness: 5,
             height: 20,             
           );
          },
              itemCount: snapshot.data.docs.length,
       );
     }
     return Center(child:
     Text("No medicine found!", style: TextStyle(fontSize: 20,color: Colors.grey),),
     );
     },),

  );
	
  
}
}*/
//......................................................................................................