import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/cart/cartfull.dart';
import 'package:medbuddy/src/ui/cart/pdtcheck/Buymap.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/home_screen.dart';

class cartMap extends StatefulWidget {
  @override
  _sellerMapageState createState() => _sellerMapageState();
}
    var cindexno;
    String cdocid;
class _sellerMapageState extends State<cartMap>{
//final collectionRef = FirebaseFirestore.instance.collection("Medicinesell");
    
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
          actions: [
          new IconButton(
          icon: new Icon(Icons.domain_verification),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> buyMap()));
          },
        ),

        ],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: Text(
          "WishList",
          style: TextStyle(
            color: Color.fromARGB(255, 250, 248, 248),
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body:  StreamBuilder(
      stream: FirebaseFirestore.instance.collection(user.email + "cart").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if (!snapshot.hasData) {   
          return Center
          (child: 
          Image.asset("assets/emptycart.gif",width:500, height:500,)
     );
        }

      else if (snapshot.data?.size == 0) {
        return Center
          (child: Image.asset("assets/emptycart.gif",width:500, height:500,));
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
                      cindexno = snapshot.data.docs[index];
                      cdocid = snapshot.data.docs[index].id;
                      //collectionRef.doc().id;
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => cartFull()));
                  },
                    onLongPress: () {
                      
        showModalBottomSheet<void>(context: context,
            builder: (BuildContext context) {
                return Container(
                    child: new Wrap(
                    children: <Widget>[
                        new ListTile(
                        leading: new Icon(Icons.delete),
                        title: new Text('Remove'),
                        onTap: () async{
                        await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
                        await myTransaction.delete(snapshot.data.docs[index].reference);
                          Fluttertoast.showToast(  
                          msg: 'Item removed from WishList',  
                          toastLength: Toast.LENGTH_LONG,  
                          gravity: ToastGravity.BOTTOM,  
                          //timeInSecForIosWeb: 1,  
                          backgroundColor: Colors.black,  
                          textColor: Colors.white  
                      );                       
                        }
                        );
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
              
                      //footer: Text(snapshot.data.docs[index]['medicine name']),
                      /*Card(
                      shadowColor: Colors.grey,
                      elevation: 10,*/
                     /* TextButton(
                        onPressed: (){
                      indexno = snapshot.data.docs[index];
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => SellerFull())
                      );
                    },                    
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        
                        Image.network(snapshot.data.docs[index]['images'],width: 100, height: 100,),
                       Padding(padding: EdgeInsets.only(top: 5),
                        child: Text(snapshot.data.docs[index]['medicine name'],
                          style: TextStyle(color: Colors.white)
                          ),),
                        
                        //Flexible(child: 
                          //Text(snapshot.data.docs[index]['email id']),),

   
                      ],),*/ 
                      

                    );
                    
                  },

        )]
        );
      }

      }));
  }}
       
//old strembuilder,list view
//......................................................................................................
  /*StreamBuilder(stream: collectionReference,
   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
     if(snapshot.hasData){*/
      /* return ListView.separated(
         itemBuilder:(BuildContext context, int index) {
           return Column(
              children: snapshot.data.docs.map((doc) {
                return Card(
                  child: Column( children: [
                  Image.network(snapshot.data.docs[index]['image'], width: 100,height: 100,),
                  Text(snapshot.data.docs[index]['medicine name']),
                  Text(snapshot.data.docs[index]['store name']),
                  /*ListTile(
                    title: Text(snapshot.data.docs[index]['medicine name']),
                    subtitle:  Image.network(snapshot.data.docs[index]['image']),
                    //Text(snapshot.data.docs[index]['store name']),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: (){
                      indexno = snapshot.data.docs[index];
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => SellerFull())
                      );
                    },
                  ),*/
                ]));
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
       );*/
//...........................................................................................................
//............................................................................................................
//     }
    /* return Center(child:
     Text("No medicine found!", style: TextStyle(fontSize: 20,color: Colors.grey),),
     );
     },
     ),

  );
	
  
}));
}}*/
//......................................................................................................