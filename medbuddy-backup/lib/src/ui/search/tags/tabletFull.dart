import 'package:blinking_text/blinking_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/global/myColors.dart';
import 'package:medbuddy/global/myDimens.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/rateing/rateing.dart';
import 'package:medbuddy/src/ui/rateing/rateingtag/rateingT.dart';
import 'package:medbuddy/src/ui/search/cartsplash/cartSplash.dart';
import 'package:medbuddy/src/ui/search/delete_splash/deleteSplash.dart';
import 'package:medbuddy/src/ui/search/googleMap.dart';
import 'package:medbuddy/src/ui/search/tags/Tablet.dart';
import 'package:url_launcher/url_launcher.dart';



class tabletFull extends StatefulWidget {

@override
  _DetailedItemState createState() => _DetailedItemState();
}

class _DetailedItemState extends State<tabletFull> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(indexnotablet['medicine name']),
      backgroundColor: Colors.deepPurple,
        //       leading: new IconButton(
        //   icon: new Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => sellerMap()),
        //     );
        //   },
        // ),
),
  //backgroundColor: Colors.orange[300],
  body: Container(
    
    child: ListView(children: [
      Padding(padding: EdgeInsets.all(10),
     child: Image.network(indexnotablet['images'],
                height: 300,
                width: 300,
                
         ),),
//............................................................................................................ 

   StreamBuilder(
      stream:  FirebaseFirestore.instance.collection("average rating").doc(Tdocid).snapshots(),
      builder: (context, snapshot) {
         if (!snapshot.hasData) {
          //hasdata = true;
          return Center
          (child: Text("0.0")
     );
        }
        

        else{
         double avg;
          try{
           avg = (snapshot.data.get('avg') / snapshot.data.get('length'));
          }catch(e){
            avg=0.0;
          }
                  return Container(
                   padding: EdgeInsets.only(left: 20),
                  child: Row(children:[
                  Text("Rating: ", style: TextStyle(fontFamily: 'JosefinSans',fontSize: 20),),
                  SizedBox(width: 5,),
                  Text(avg.toStringAsFixed(1),
                  style: TextStyle(color: Color.fromARGB(255, 38, 121, 216),
                  fontFamily: 'JosefinSansBI', fontSize: 50,),),
                  SizedBox(width: 5,),
                  Text("out of 5", style: TextStyle(fontFamily: 'JosefinSans'),),

                  ])
                  );
                  }}),
 
//............................................................................................................
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children:[
                  Text("Discount:", style: TextStyle(fontFamily: 'JosefinSans'),),
                  SizedBox(width: 10,),
                  Padding(padding: EdgeInsets.only(right: 10),
                  child: BlinkText(indexnotablet['discount %'] + "%",
                  style: TextStyle(color: Colors.green, fontSize: 30, fontFamily: 'arvoBold'),
                  	endColor: Colors.greenAccent,
	                  duration: Duration(seconds: 1)),
                  )]),

//gap btw borders
          const SizedBox(
            height: 16,
          ), 

    Card(
    child: ListTile(
    title:  Text("Discount price:" + " " + indexnotablet['discount price']),
    )),

//gap btw borders
          const SizedBox(
            height: 16,
          ),

    Card(
    child: ListTile(
    title:  Text("Dosage:" + " " + indexnotablet['dosage']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),  
    Card(
    child: ListTile(              
    title:  Text("Price:" + " " + indexnotablet['price']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("Address:" + " " + indexnotablet['address']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
    Card(
    child: ListTile(                
    title:  Text("Mobile no:" + " " + indexnotablet['mobile no']),
      trailing: Icon(Icons.arrow_forward_ios),
        onTap: (){
     _makePhoneCall();

    }
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("Email-id:" + " " + indexnotablet['email id']),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: (){
     _sendingMails();

    }
    )),
        Card(
    child: ListTile(              
    title:  Text("Date:" + " " + indexnotablet['date']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
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

//button for fav  
        OutlineButton(
        onPressed: () async {

        bool docExits = await checkIfDocExists(Tdocid);
        if(docExits == true){
                      Fluttertoast.showToast(  
                      msg: 'Item removed from WishList',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DSplash()));                 
            return collectionCart.doc(Tdocid).delete();
        } else{
          collectionCart.doc(Tdocid).set(
                        {
                          'medicine name': indexnotablet['medicine name'],
                          'email id': indexnotablet['email id'],
                          'mobile no': indexnotablet['mobile no'],
                          'address': indexnotablet['address'],
                          'price': indexnotablet['price'],
                          'dosage': indexnotablet['dosage'],
                          'discount %': indexnotablet['discount %'],
                          'discount price': indexnotablet['discount price'],
                          'images': indexnotablet['images'],
                          'date': indexnotablet['date'],


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
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(Icons.shopping_cart_outlined,color: MyColors.lightPink,),
                                                 ])
                                        ),
                                      ),           
        SizedBox(height: 40,),

        Text("Coustomer Review:",
        style: TextStyle(color: Colors.black,fontFamily: 'JosefinSans', fontSize: 30,)
        ),

        Divider(
        indent: 5,
        endIndent: 5,
        color: Colors.black,
    ), 

        SizedBox(height: 30,),
  StreamBuilder(
      stream: FirebaseFirestore.instance.collection(Tdocid + "review")
          .orderBy("rateing", descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if (!snapshot.hasData) {
          //hasdata = true;
          return Center
          (child: Text("No coustomer rateing")
     );
        }
        
        else if (snapshot.data?.size == 0) {

          
            return Center
          (child: Text("No coustomer rateing",
          style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans', fontSize: 20,))
          );
        }

        else{
                 return ListView.builder(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,

                  itemBuilder: (BuildContext context, int index) {
                  return Card(
                  child: Column(
                  children: [
                  SizedBox(height: 10,),
                    Row(children:[
                  SizedBox(width: 10,),
                  Container(
                  color: Colors.green,
                  child: Row(children: [
                  SizedBox(width: 5,),
                  Text(snapshot.data.docs[index]['rateing'],
                  style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans', fontSize: 20,)),
                  SizedBox(width: 5,),
                  Icon(Icons.star,color: Colors.white,size: 15,),
                  SizedBox(width: 5,),
                     ],) ),]),

                  SizedBox(height: 10,),
                  Row(children:[
                  SizedBox(width: 10,),
                  Text("Name:" + " "),
                  Text(snapshot.data.docs[index]['name']),]),

                  SizedBox(height: 30,),
                  Row(children:[
                  SizedBox(width: 10,),
                  Text('Review:'),]),  
                  SizedBox(height: 10,), 
                  Container(  alignment: Alignment.topLeft,                  
                  child: Padding(
                    padding: EdgeInsets.all(20), 
                    child:
                  Text(snapshot.data.docs[index]['review']),),),
                  ],),
          
            );
                  });}}),
                              SizedBox(height: 30),         
  //button for review
                                OutlineButton(
                                        onPressed: () async {
                             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => rateingT()));
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MyDimens.double_4)),
                                        borderSide: BorderSide(
                                            color: Colors.deepPurpleAccent,
                                            width: MyDimens.double_1),
                                        color: Colors.deepPurpleAccent,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: MyDimens.double_15,
                                              bottom: MyDimens.double_15),
                                          child: 
                                           Text("Add your review",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                  color:
                                                  Colors.deepPurpleAccent,
                                                  //fontFamily:
                                                 // 'lexenddeca'
                                                 )),
                                        ),
                                      ),  
            SizedBox(height: 30,), 
      
    ]
  ),),
);
}
 _makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: indexnotablet['mobile no'],
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
  path: indexnotablet['email id'],
  query: encodeQueryParameters(<String, String>{
    'subject': 'medhelper'
  }),
);

launchUrl(emailLaunchUri);
}
//.......................................................................................
//to check doc id
var collectionCart = FirebaseFirestore.instance.collection(user.email + "cart");
 Future<bool> checkIfDocExists(String docId) async{
  try{
    var doc = await collectionCart.doc(docId).get();
    return doc.exists;
  }catch (e){
    print(e);
  }
}
//.......................................................................................
}