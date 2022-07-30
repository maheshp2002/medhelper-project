import 'package:blinking_text/blinking_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/global/myColors.dart';
import 'package:medbuddy/global/myDimens.dart';
import 'package:medbuddy/src/ui/cart/cartmap.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/rateing/rateingtag/Bdeleterating.dart';
import 'package:medbuddy/src/ui/rateing/rateingtag/rateingB.dart';
import 'package:medbuddy/src/ui/search/cartsplash/cartSplash.dart';
import 'package:medbuddy/src/ui/search/delete_splash/deleteSplash.dart';
import 'package:medbuddy/src/ui/search/googleMap.dart';
import 'package:medbuddy/src/ui/search/tags/Bottle.dart';
import 'package:url_launcher/url_launcher.dart';


class bottleFull extends StatefulWidget {

@override
  _DetailedItemState createState() => _DetailedItemState();
}

class _DetailedItemState extends State<bottleFull> {
var collectionCart = FirebaseFirestore.instance.collection(user.email + "cart");
 List<String> images = [
  indexnobottle['images'],
  indexnobottle['images1'],
  indexnobottle['images2']

 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(indexnobottle['medicine name']),
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
    //  child: Image.network(indexnobottle['images'],
    //             height: 300,
    //             width: 300,
                
    //      ),),
     child: SizedBox(
      height: 300,
   child:  CarouselSlider(
          options: CarouselOptions(
            scrollPhysics: const ScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            height: double.infinity,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            autoPlay: true,
          ),
          items: images
          .map(
            (e) => Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 221, 218, 233).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 30.0,
                    offset: -Offset(0, 3),
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(e),
                ),
              ),
            ),
          )
          .toList(),
    )

    ),),   
//............................................................................................................ 

   StreamBuilder(
      stream:  FirebaseFirestore.instance.collection("average rating").doc(Bdocid).snapshots(),
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
                  return Row(children: [
                  SizedBox(width: 10,),
                  Container( 
                  height: 40,
                  color: Color.fromARGB(255, 5, 240, 130),
                 child: Row(
                  children:[
                  SizedBox(width: 5,),
                  Text(avg.toStringAsFixed(1), style: TextStyle(
                    color: Colors.white,fontFamily: 'JosefinSans', fontSize: 20,),),
                  SizedBox(width: 5,),
                  Icon(Icons.star,color: Colors.white,size: 20,),

                  SizedBox(width: 5,),
                  ])
                  )
                  ]);
                  }}),
 
//............................................................................................................
                  SizedBox(height: 20,),              
                  Row(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children:[ 
                  Text("Price:", style: TextStyle(fontFamily: 'JosefinSansBD',fontSize: 10),),   
                  SizedBox(width: 5,),              
                  Text(indexnobottle['price'],
                  style: TextStyle(color: Colors.red, fontSize: 30, fontFamily: 'arvoBold'),
                  ),
                  Text('Rs',style: TextStyle(color: Colors.grey, fontFamily: 'JosefinSansBD',fontSize: 10),),
                  ]),
                  
                  SizedBox(width: 40,),
                  Flexible(child:  
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children:[
                  Text("Discount:", style: TextStyle(fontFamily: 'JosefinSans',fontSize: 10),),
                  SizedBox(width: 10,),
                  Padding(padding: EdgeInsets.only(right: 10),
                  child: BlinkText(indexnobottle['discount %'] + "%",
                  style: TextStyle(color: Colors.green, fontSize: 20, fontFamily: 'arvoBold'),
                  	endColor: Colors.greenAccent,
	                  duration: Duration(seconds: 1)),
                  )]),),
                  ],),
//.....................................................................................................

//gap btw borders
         const SizedBox(
            height: 16,
          ), 

   StreamBuilder(
      stream:  FirebaseFirestore.instance.collection("Medicinesell").doc(Bdocid).snapshots(),
      builder: (context, snapshot) {
         if (!snapshot.hasData) {
          //hasdata = true;
          return Center
          (child: Text("0.0")
     );
        }
        

        else{
//for stock no
          String stock;
          Color clr;
          try{
          int stckno = snapshot.data.get('stockno');
          int stc = int.parse(stckno.toStringAsFixed(0));
            if(stckno >= 10){
              stock = "In stock";
              clr= const Color(0xFF4CAF50);
            } else if (stckno < 10 || stckno > 0) {
              stock = "Only $stc left";
              clr= Color.fromARGB(255, 255, 0, 0);
            } else {
               stock = "Out of stock";
               clr= Color.fromARGB(255, 255, 0, 0);
            }

          }catch(e){
            stock = "Out of stock";

          }
                  return Container(
                   padding: EdgeInsets.only(left: 10),
                  child: Row(children:[
                  Text(stock,
                  style: TextStyle(color: clr,
                  fontWeight: FontWeight.w700, fontSize: 15,),),
                  ])
                  );

}}),

//gap btw borders
          const SizedBox(
            height: 16,
          ), 


    Card(
    child: ListTile(
    title:  Text("Actual price:" + " " + indexnobottle['discount price']),
    )),

//gap btw borders
          const SizedBox(
            height: 16,
          ),

    Card(
    child: ListTile(
    title:  Text("Dosage:" + " " + indexnobottle['dosage']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),  
//     Card(
//     child: ListTile(              
//     title:  Text("Price:" + " " + indexnobottle['price']),
//     )),
// //gap btw borders
//           const SizedBox(
//             height: 16,
//           ), 
    Card(
    child: ListTile(               
    title:  Text("Address:" + " " + indexnobottle['address']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
    Card(
    child: ListTile(                
    title:  Text("Mobile no:" + " " + indexnobottle['mobile no']),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: (){
     _makePhoneCall();

    },
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("Email-id:" + " " + indexnobottle['email id']),
    trailing: Icon(Icons.arrow_forward_ios),
        onTap: (){
     _sendingMails();

    }
    )),
      Card(
    child: ListTile(              
    title:  Text("Expire date:" + " " + indexnobottle['date']),
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

    SizedBox(
      height: 20,
    ),

  //  Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //   ElevatedButton(
  //     style: ButtonStyle(
  //      shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10))),
  //     fixedSize: MaterialStateProperty.all(Size(150, 50)),
  //       backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 211, 211, 208))),
  //     //onPressed: ,
  //    child: Text("View cart", style: TextStyle(color: Colors.black),)),

  //  SizedBox(
  //     width: 30,
  //   ),  

  //   ElevatedButton(
  //     style: ButtonStyle(
  //      shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10))),
  //     fixedSize: MaterialStateProperty.all(Size(150, 50)),
  //       backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 250, 225, 2))),
  //     //onPressed: ,
  //    onPressed: () { 
  //      FirebaseFirestore.instance.collection("Medicinesell").doc(Bdocid).update({
  //       'stockno': FieldValue.increment(-1),
  //      });
  //     },
  //    child: Text("Add to cart", style: TextStyle(color: Colors.black),)),
      
  //     ]),


  // SizedBox(
  //     height: 20,
  //   ),


//button for fav  
        OutlineButton(
        onPressed: () async {

        bool docExits = await checkIfDocExists(Bdocid);
        if(docExits == true){
                      Fluttertoast.showToast(  
                      msg: 'Item already in WishList',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => cartMap()));
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DSplash()));
            // return collectionCart.doc(docidsearch).delete();
        } else{
          collectionCart.doc(Bdocid).set(
                        {
                          'medicine name': indexnobottle['medicine name'],
                          'email id': indexnobottle['email id'],
                          'mobile no': indexnobottle['mobile no'],
                          'address': indexnobottle['address'],
                          'price': indexnobottle['price'],
                          'dosage': indexnobottle['dosage'],
                          'discount %': indexnobottle['discount %'],
                          'discount price': indexnobottle['discount price'],
                          'images': indexnobottle['images'],
                          'images1': indexnobottle['images1'],
                          'images2': indexnobottle['images2'],
                          'date': indexnobottle['date'],
                          'expire': indexnobottle['expire'],


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

        Text("Customer Review:",
        style: TextStyle(color: Colors.black,fontFamily: 'JosefinSans', fontSize: 30,)
        ),

        Divider(
        indent: 5,
        endIndent: 5,
        color: Colors.black,
    ), 

        SizedBox(height: 30,),
  StreamBuilder(
      stream: FirebaseFirestore.instance.collection(Bdocid + "review")
          .orderBy("rateing", descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if (!snapshot.hasData) {
          //hasdata = true;
          return Center
          (child: Text("No customer rating")
     );
        }
        
        else if (snapshot.data?.size == 0) {

          
            return Center
          (child: Text("No customer rating",
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
                             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => rateingB()));
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

             InkWell(
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Bratingdlt()));

          },
     child: new Padding(
      padding: const EdgeInsets.only(
        top: 60.0,
      ),
      child: new Text(
        "Delete rating",
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
  ),),
);
}
//var collectionCart = FirebaseFirestore.instance.collection(user.email + "cart");
  //.......................................................................................
//to check doc id
 Future<bool> checkIfDocExists(String docId) async{
  try{
    var doc = await collectionCart.doc(docId).get();
    return doc.exists;
  }catch (e){
    print(e);
  }
}
//.......................................................................................
_sendingMails()  {
String encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: indexnobottle['email id'],
  query: encodeQueryParameters(<String, String>{
    'subject': 'medhelper'
  }),
);

launchUrl(emailLaunchUri);
}

 _makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: indexnobottle['mobile no'],
    );
    await launchUrl(launchUri);
  }
}