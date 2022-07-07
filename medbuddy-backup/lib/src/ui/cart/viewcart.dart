import 'package:blinking_text/blinking_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/src/ui/cart/Buyproduct.dart';
import 'package:medbuddy/src/ui/cart/cartfull.dart';
import 'package:medbuddy/src/ui/cart/cartmap.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/search/googleMap.dart';
import 'package:url_launcher/url_launcher.dart';


class viewcart extends StatefulWidget {

@override
  _DetailedItemState createState() => _DetailedItemState();
}

class _DetailedItemState extends State<viewcart> {
  final isstockempty = FirebaseFirestore.instance.collection("Medicinesell").doc(cdocid);
  final iscartempty = FirebaseFirestore.instance.collection(user.email + "cart").doc(cdocid);


   List<String> images = [
  cindexno['images'],
  cindexno['images1'],
  cindexno['images2']

 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(cindexno['medicine name']),
      backgroundColor: Colors.deepPurple,
              leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
),
  //backgroundColor: Colors.orange[300],
  body: Container(
    
    child: ListView(children: [
      Padding(padding: EdgeInsets.all(10),
    //  child: Image.network(cindexno['images'],
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
      stream:  FirebaseFirestore.instance.collection("average rating").doc(cdocid).snapshots(),
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
                  Text(cindexno['price'],
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
                  child: BlinkText(cindexno['discount %'] + "%",
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
      stream:  FirebaseFirestore.instance.collection(user.email + "cart").doc(cdocid).snapshots(),
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
           int stckno;
          try{

          stckno = snapshot.data.get('stock');
          stock = stckno.toStringAsFixed(0);

          }catch(e){
            stock = "0";

          }
                  return Container(
                   padding: EdgeInsets.only(left: 10),
                  child: Row(children:[
                    ElevatedButton(
                      style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 224, 224, 224))
                      ),                      
                      onPressed: (){
          if(stckno != 0){
         FirebaseFirestore.instance.collection("Medicinesell").doc(cdocid).update({
         'stockno': FieldValue.increment(1),
       });
     
         FirebaseFirestore.instance.collection(user.email + "cart").doc(cdocid).update({
         'stock': FieldValue.increment(-1),
       });
                      Fluttertoast.showToast(  
                      msg: 'Item removed from cart',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white); 
                 } else {

                      Fluttertoast.showToast(  
                      msg: 'Cart empty',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white);                 
                  }

                      },
                     child: Text("-", style: TextStyle(fontSize: 30, color: Colors.black,)) ,
                     ),

                  ElevatedButton(
                       style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 252, 249, 249))
                      ),                   
                  child: Text(stock,
                  style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.w700, fontSize: 15,),)),

                   ElevatedButton(
                      style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 224, 224, 224))
                      ),
                      onPressed: () async{
                       int cartempty;
           await isstockempty.get().then((snapshot) {
           cartempty = snapshot.get('stockno');
        });

        if (cartempty != 0){
                        
         FirebaseFirestore.instance.collection("Medicinesell").doc(cdocid).update({
         'stockno': FieldValue.increment(-1),
       });
          FirebaseFirestore.instance.collection(user.email + "cart").doc(cdocid).update({
         'stock': FieldValue.increment(1),     
       }); 

                       Fluttertoast.showToast(  
                      msg: 'Item added to cart',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white);  
                  }  else {

                      Fluttertoast.showToast(  
                      msg: 'Out of stock',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white); 

                  }                     
                      },
                     child: Icon(Icons.add, color: Colors.black,),
                     
                     ),                 
                  ])
                  );

}}),

//gap btw borders
          const SizedBox(
            height: 16,
          ), 

    Card(
    child: ListTile(
    title:  Text("Actual price:" + " " + cindexno['discount price']),
    )),

//gap btw borders
          const SizedBox(
            height: 16,
          ),  
 
    Card(
    child: ListTile(
    title:  Text("Dosage:" + " " + cindexno['dosage']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),  
    Card(
    child: ListTile(              
    title:  Text("Price:" + " " + cindexno['price']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
//     Card(
//     child: ListTile(              
//     title:  Text("Expire date:" + " " + indexnobtm['expire']),
//     )),
// //gap btw borders
//           const SizedBox(
//             height: 16,
//           ), 

    Card(
    child: ListTile(               
    title:  Text("Address:" + " " + cindexno['address']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
    Card(
    child: ListTile(                
    title:  Text("Mobile no:" + " " + cindexno['mobile no']),
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
    title:  Text("Email-id:" + " " + cindexno['email id']),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: (){
     _sendingMails();

    }
    )),
        Card(
    child: ListTile(              
    title:  Text("Expire date:" + " " + cindexno['date']),
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
  //   SizedBox(
  //     height: 10,
  //   ),

  //   Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //   ElevatedButton(
  //     style: ButtonStyle(
  //      shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10))),
  //     fixedSize: MaterialStateProperty.all(Size(150, 50)),
  //       backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 211, 211, 208))),
  //     //onPressed: ,
  //    child: Text("View wishlist", style: TextStyle(color: Colors.black),)),

  //  SizedBox(
  //     width: 20,
  //   ),  

  //   ElevatedButton(
  //     style: ButtonStyle(
  //      shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10))),
  //     fixedSize: MaterialStateProperty.all(Size(170, 50)),
  //       backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 250, 225, 2))),
  //     //onPressed: ,
  //    onPressed: () { 
  //       FirebaseFirestore.instance.collection("Medicinesell").doc(cdocid).update({
  //        'stockno': FieldValue.increment(1),
  //      });
  //                      Fluttertoast.showToast(  
  //                     msg: 'Item removed from cart',  
  //                     toastLength: Toast.LENGTH_LONG,  
  //                     gravity: ToastGravity.BOTTOM,  
  //                     //timeInSecForIosWeb: 1,  
  //                     backgroundColor: Colors.black,  
  //                     textColor: Colors.white  
  //                 );
  //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => cartSucess()));             
  //     },
  //    child: Text("Remove from cart", style: TextStyle(color: Colors.black),)),
      
  //     ]),


  SizedBox(
      height: 10,
    ),

  StreamBuilder(
      stream:  FirebaseFirestore.instance.collection(user.email + "cart").doc(cdocid).snapshots(),
      builder: (context, snapshot) {
         if (!snapshot.hasData) {
          //hasdata = true;
          return Center
          (child: Text("0.0")
     );
        }
        

        else{
     return ElevatedButton(
      style: ButtonStyle(
       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
      //fixedSize: MaterialStateProperty.all(Size(170, 50)),
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 250, 225, 2))),
      //onPressed: ,
     onPressed: () async { 
      //stckno = snapshot.data.get('stock').toString();
          int cartempty;
           await iscartempty.get().then((snapshot) {
           cartempty = snapshot.get('stock');
        });

        if (cartempty != 0){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Buyproduct())); 
      } else {
                     Fluttertoast.showToast(  
                      msg: 'Cart empty',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white); 
                  }            
      },
     child: Text("Buy Product", style: TextStyle(color: Colors.black),));  

}}),

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
      path: cindexno['mobile no'],
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
  path: cindexno['email id'],
  query: encodeQueryParameters(<String, String>{
    'subject': 'medhelper'
  }),
);

launchUrl(emailLaunchUri);
}


}