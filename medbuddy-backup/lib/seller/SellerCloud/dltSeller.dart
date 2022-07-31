import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/seller/deletePDT.dart';






class dltSeller extends StatefulWidget {
  @override
  _sellerMapageState createState() => _sellerMapageState();
}
var indexnobottle;
String Bdocid;
class _sellerMapageState extends State<dltSeller>{
  String images;
User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Delete product",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body: 
  StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Medicinesell").where('Did', isEqualTo: user.email).snapshots(),
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
                  showModalBottomSheet<void>(context: context,
                  builder: (BuildContext context) {
                    return Container(
                    child: new Wrap(
                    children: <Widget>[
                        new ListTile(
                        leading: new Icon(Icons.delete),
                        title: new Text('Delete'),
                        onTap: () async{ 

                         deleteFile(snapshot.data.docs[index]['images']);     
                         deleteFile(snapshot.data.docs[index]['images1']);  
                         deleteFile(snapshot.data.docs[index]['images2']);  

                        await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
                        await myTransaction.delete(snapshot.data.docs[index].reference);}
                        );
                        
                         try{     

                         await FirebaseFirestore.instance.collection(snapshot.data.docs[index].id + "review").snapshots().forEach((element) {
                         for (QueryDocumentSnapshot snapshot in element.docs) {
                         snapshot.reference.delete();
                         }});  
                        }

                         catch(e){ 
                          print(e);
                         }


                        //  deleteFile(snapshot.data.docs[index]['images']);     
                        //  deleteFile(snapshot.data.docs[index]['images1']);  
                        //  deleteFile(snapshot.data.docs[index]['images2']);   
                                       
                        // await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
                        // await myTransaction.delete(snapshot.data.docs[index].reference);}
                        // );
                         
                        })
                        ]
                        )
                        );}
                        );  
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(child: 
                      Image.network(snapshot.data.docs[index]['images1'],
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
                      //images=(snapshot.data.docs[index]['images']),                        
                    ],
                  ),
                ),
              
                      

                    );
                    
                  },

        ),
            SizedBox(height: 50,),

        Text(
                "Note:- Please delete all order details before deleting product.",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: new TextStyle(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.5,
                    color: Colors.grey,
                    fontSize: 12.0),
              ),
            SizedBox(height: 30,), 

          InkWell(
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DeletePdt()));

          },
     child: new Padding(
      padding: const EdgeInsets.only(
        top: 60.0,
      ),
      child: new Text(
        "Can't delete?...click here...",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: Colors.grey,
            fontSize: 12.0),
      ),
    )),
    SizedBox(height: 30,),
        ]
        );
      }}

    ));
  }


  }
  
  
  Future<void> deleteFile(String url) async {
  try {
    await FirebaseStorage.instance.refFromURL(url).delete();
  } catch (e) {
    print("Error deleting db from cloud: $e");
  }
}
 