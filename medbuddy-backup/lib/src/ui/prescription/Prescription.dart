import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/login%20page/register.dart';

class Prescription extends StatefulWidget {
  @override
    _PrescriptionState createState() => _PrescriptionState();
}


String prescription;

class _PrescriptionState extends State<Prescription> {

@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: AddData(),
	);
}
}

class AddData extends StatelessWidget {
  final collectionReference = FirebaseFirestore.instance.collection(user.email).snapshots();

 /* @override
  Widget build(BuildContext context) {
      return StreamBuilder(
      stream: collectionReference,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
              return Center(child: const Text('Loading prescription...'));
          }
        return
        Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                    Colors.lightGreen[800],
                    Colors.black,
                  ], radius: 0.85, focal: Alignment.center),
                ),
                child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Text(snapshot.data.docs[index]['prescription'],style: TextStyle(fontSize: 10));
          },
          itemCount: snapshot.data.docs.length,
        ));
      },
    );
  }
}*/

/*@override
Widget build(BuildContext context) {
	return 
  
  Scaffold(
  appBar: AppBar(
        backgroundColor: Color(0xFF3EB16F),

        title: Text(
          "Prescription",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body: StreamBuilder(stream: collectionReference,
   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
     if(snapshot.hasData){
       return ListView(
         
         children: snapshot.data.docs.map((e) => ListTile(
           
           tileColor: Colors.blue,
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.white30),
          ),
            /* onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => dbfull(),
                  ),);},*/
           title: Text(e['prescription']),)).toList(),
       );
     }
     return Center(child: CircularProgressIndicator(),
     );
     },),

  );
	
  
}
}*/

 @override
Widget build(BuildContext context) {

 /* _tilecolor (){
  Color mycolor;
  int n=0;
  if(n<=5){

      if(n==0){mycolor = Colors.blue;  n++;}
      if(n==1){mycolor = Colors.green;  n++;}
      if(n==2){mycolor = Colors.orange;  n++;}
      if(n==3){mycolor = Colors.purple;  n++;}
      if(n==4){mycolor = Colors.yellow;  n++;}

  }else{
    n=0;
  }
  return mycolor;

}*/
	return Scaffold(
  appBar: AppBar(
        backgroundColor: Color(0xFF3EB16F),

        title: Text(
          "Prescription",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body: StreamBuilder(stream: collectionReference,
   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
     if(snapshot.hasData){
       return GridView(
         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
         children: snapshot.data.docs.map((e) => ListTile(
           tileColor: Color.fromARGB(255, 232, 185, 240),//_tilecolor(),
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.white60, width: 5,),
          ),

           title: Text(e['prescription']),)).toList(),
         

       );
       
     }
     return Center(child: //CircularProgressIndicator(),
     Text("No Prescription Found !", style: TextStyle(fontSize: 20,color: Colors.grey),),
     );
     },),

  );
	
  
}
}   
       
       
       
 //for color

