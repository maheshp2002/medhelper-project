import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/global/myColors.dart';
import 'package:medbuddy/global/myDimens.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/search/SellerMap.dart';
import 'package:medbuddy/src/ui/search/cartsplash/cartSplash.dart';
import 'package:medbuddy/src/ui/search/delete_splash/deleteSplash.dart';
import 'package:medbuddy/src/ui/search/googleMap.dart';
import 'package:url_launcher/url_launcher.dart';

class SellerFull extends StatefulWidget {

@override
  _DetailedItemState createState() => _DetailedItemState();
}

var collectionCart = FirebaseFirestore.instance.collection(user.email + "cart");
class _DetailedItemState extends State<SellerFull> {
@override
  void setState(VoidCallback checkbool1) {
    super.setState(checkbool1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(indexno['medicine name']),
      backgroundColor: Colors.deepPurple,
              leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
           // checkbool1();
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => sellerMap()),
            );
          },
        ),
),
  //backgroundColor: Colors.orange[300],
  body: Container(
    
    child: ListView(children: [
      Padding(padding: EdgeInsets.all(10),
     child: Image.network(indexno['images'],
                height: 300,
                width: 300,
                
         ),),

    Card(
    child: ListTile(
    title:  Text( indexno['discount %'] + "%",
     style: TextStyle(color: Colors.green, fontSize: 30, fontFamily: 'JosefinSans'),),
    )),

//gap btw borders
          const SizedBox(
            height: 16,
          ), 

    Card(
    child: ListTile(
    title:  Text("Discount price:" + " " + indexno['discount price']),
    )),

//gap btw borders
          const SizedBox(
            height: 16,
          ),         

    Card(
    child: ListTile(
    title:  Text("Dosage:" + " " + indexno['dosage']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),  
    Card(
    child: ListTile(              
    title:  Text("Price:" + " " + indexno['price']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("Address:" + " " + indexno['address']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
    Card(
    child: ListTile(                
    title:  Text("Mobile no:" + " " + indexno['mobile no']),
    trailing: Icon(Icons.arrow_forward_ios),
    onTap: (){
     _makePhoneCall();

    })),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("Email-id:" + " " + indexno['email id']),
    trailing: Icon(Icons.arrow_forward_ios),
        onTap: (){
     _sendingMails();

    }
    )),
//gap btw borders

          const SizedBox(
            height: 16,
          ),
    Card(
    child: ListTile(              
    title:  Text("Date:" + " " + indexno['date']),
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
    ),

    SizedBox(
      height: 10,
    ),

//button for fav  
        OutlineButton(
        onPressed: () async {
        
        bool docExits = await checkIfDocExists(docid);
        if(docExits == true){
          
         // checkbool1();
                      Fluttertoast.showToast(  
                      msg: 'Item removed from WishList',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DSplash()));
            return collectionCart.doc(docid).delete();
        } else{
          //checkbool1();
          collectionCart.doc(docid).set(
                        {
                          'medicine name': indexno['medicine name'],
                          'email id': indexno['email id'],
                          'mobile no': indexno['mobile no'],
                          'address': indexno['address'],
                          'price': indexno['price'],
                          'dosage': indexno['dosage'],
                          'discount %': indexno['discount %'],
                          'discount price': indexno['discount price'],
                          'images': indexno['images'],
                            

                        });
                       Fluttertoast.showToast(  
                      msg: 'Item added to WishList',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );                       
        }
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => cartSucess()));
        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MyDimens.double_4)),
                                        borderSide: BorderSide(
                                            color: MyColors.lighterPink,
                                            width: MyDimens.double_1),
                                        color: MyColors.primaryColor,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: MyDimens.double_15,
                                              bottom: MyDimens.double_15),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children:[
                                             //docex == true?
                                           Text("WishList",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                  color:
                                                  MyColors.lighterPink,
                                                  //fontFamily:
                                                 // 'lexenddeca'
                                                 )),                                              
                                            // :Text("add to Cart",
                                            //    style: Theme.of(context)
                                            //        .textTheme
                                            //        .subtitle1
                                            //        .copyWith(
                                            //        color:
                                            //        MyColors.lighterPink,
                                            //        //fontFamily:
                                            //      // 'lexenddeca'
                                            //      )),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                //docex == true?
                                                Icon(Icons.shopping_cart_outlined,color: MyColors.lightPink,)
                                               //: Icon(Icons.shopping_cart_outlined,color: MyColors.lightPink,)
                                                 ])
                                        ),
                                      ),           
  SizedBox(
      height: 10,
    ),
  ]
  ),),
);
}

 _makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: indexno['mobile no'],
    );
    await launchUrl(launchUri);
  }
_sendingMails()  {
String encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: indexno['email id'],
  query: encodeQueryParameters(<String, String>{
    'subject': 'medhelper'
  }),
);

launchUrl(emailLaunchUri);
}
 
}
//  checkbool() async{
//  bool docExits = await checkIfDocExists(docid);
//          if(docExits == true){
//            docex = true;
          
//  }else{
//    docex = false;
// return docex;
//  }
//  }
//.......................................................................................
//to check doc id
 Future<bool> checkIfDocExists(String docId) async{
  try{
    //var collectionRef = FirebaseFirestore.instance.collection(user.email + "cart");
    var doc = await collectionCart.doc(docId).get();
    return doc.exists;
  }catch (e){
    print(e);
  }
//.............................................................

 }
//use checkifdoc to check a doc exit, if yes remove it, else create a doc in sellercart with name
//of sellermap doc, using a seperate function to check if docex is true if true display text

//.......................................................................................
