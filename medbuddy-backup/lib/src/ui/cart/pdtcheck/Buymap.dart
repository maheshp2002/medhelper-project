import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/cart/cartmap.dart';
import 'package:medbuddy/src/ui/cart/pdtcheck/Buyfull.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:fluttertoast/fluttertoast.dart';

class buyMap extends StatefulWidget {
  @override
  _sellerMapageState createState() => _sellerMapageState();
}
    var buyindexno;
    String buydocid;
class _sellerMapageState extends State<buyMap>{
//final collectionRef = FirebaseFirestore.instance.collection("Medicinesell");
    
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => cartMap()),
            );
          },
        ),
        title: Text(
          "Products you bought",
          style: TextStyle(
            color: Color.fromARGB(255, 250, 248, 248),
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body:  StreamBuilder(
      stream: FirebaseFirestore.instance.collection(user.email + "Productbuy").snapshots(),
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
                      buyindexno = snapshot.data.docs[index];
                      buydocid = snapshot.data.docs[index].id;
                      //collectionRef.doc().id;
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => buyFull()));
                  },
                    onLongPress: () {
                      
        showModalBottomSheet<void>(context: context,
            builder: (BuildContext context) {
                return Container(
                    child: new Wrap(
                    children: <Widget>[
                        new ListTile(
                        leading: new Icon(Icons.delete),
                        title: new Text('Cancel delivery'),
                        onTap: () async{
                        await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
                        await myTransaction.delete(snapshot.data.docs[index].reference);
                          Fluttertoast.showToast(  
                          msg: 'Item canceled',  
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
                      Text("Price: " + snapshot.data.docs[index]['price'],textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green),
                      ),),                         
                    ],
                  ),
                ),
                                   
                    );
                    
                  },

        )]
        );
      }

      }));
  }}
       
