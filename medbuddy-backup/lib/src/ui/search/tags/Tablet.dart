import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/tags/tabletFull.dart';





class tablet extends StatefulWidget {
  @override
  _sellerMapageState createState() => _sellerMapageState();
}
var indexnotablet;
String Tdocid;
class _sellerMapageState extends State<tablet>{
    //final collectionReference = FirebaseFirestore.instance.collection("Medicinesell").snapshots();
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        //  leading: new IconButton(
        //    icon: new Icon(Icons.arrow_back),
        //    onPressed: () {
        //      Navigator.push(
        //        context,
        //        MaterialPageRoute(builder: (context) => sellerMap()),
        //     );
        //   },
        // ),
        title: Text(
          "Tablet",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body: 
  StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Medicinesell").where('ID', isEqualTo: 'tablet').snapshots(),
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
                      indexnotablet = snapshot.data.docs[index];
                      Tdocid = snapshot.data.docs[index].id;
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => tabletFull()));
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
                      Text("Discount: " + snapshot.data.docs[index]['discount %'] + "%",textAlign: TextAlign.center,
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
  
  
  
 