import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/SellerMap.dart';
import 'package:medbuddy/src/ui/search/sellerFull.dart';




class pill extends StatefulWidget {
  @override
  _sellerMapageState createState() => _sellerMapageState();
}
var indexnopill;
String pills = "pill";
class _sellerMapageState extends State<pill>{
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
          "Pill",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body: 
  StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Medicinesell").where('ID', isEqualTo: 'pill').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if (!snapshot.hasData) {
          return Center
          (child: Image.asset("assets/nothing.gif")
     );
        }


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
                      indexnopill = snapshot.data.docs[index];
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => SellerFull()));
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
                    ],
                  ),
                ),
              
                      

                    );
                    
                  },

        )]
        );
      },

    ));
  }}
  
  
  
 