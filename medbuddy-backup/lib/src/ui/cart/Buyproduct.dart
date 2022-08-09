//import 'dart:convert';
//import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/src/ui/cart/buysplash.dart';
import 'package:medbuddy/src/ui/cart/cartmap.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:pay/pay.dart';


class Buyproduct extends StatefulWidget {

@override
  _DetailedItemState createState() => _DetailedItemState();
}

class _DetailedItemState extends State<Buyproduct> {
  final users = FirebaseFirestore.instance.collection("username").doc(user.uid);
  final iscartempty = FirebaseFirestore.instance.collection(user.email + "cart").doc(cdocid);
  final isstockempty = FirebaseFirestore.instance.collection("Medicinesell").doc(cdocid);



  final TextEditingController _address = TextEditingController();
  final TextEditingController _pin = TextEditingController();
  final TextEditingController _address2 = TextEditingController();
  final TextEditingController _mobileno = TextEditingController();

String stocks;
String address;
String address2;
String pin;
String mobileno;
Map<String, dynamic> paymentIntentData;


List<String> images = [
cindexno['images'],
cindexno['images1'],
cindexno['images2']

];
 
// var _paymentItems = [
//   PaymentItem(
//     label: 'Total',
//     amount: '99.99',
//     status: PaymentItemStatus.final_price,
//   )
// ];
final _paymentItems = <PaymentItem>[];

  @override
  Widget build(BuildContext context) {

    //payment item
    _paymentItems.add(PaymentItem(amount: cindexno['price'], label: cindexno['medicine name'], status: PaymentItemStatus.final_price,));
    
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

   child:  Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         const SizedBox(
            width: 10,
          ),
        Image.network(cindexno['images'],width: 100,height: 100),
        const SizedBox(
          width: 10,
        ),  
        Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
           const SizedBox(
            height: 10,
          ),

        Text("Medicine name:" + " " + cindexno['medicine name']),  

           const SizedBox(
            height: 10,
          ),        

        Text("Price" + " " + cindexno['price'] + "Rs",
        //style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 10, fontFamily: 'arvoBold'),
      ),

 //gap btw borders
          const SizedBox(
            height: 10,
          ), 
  Text("Expire date:" + " " + cindexno['date']),

//gap btw borders
          const SizedBox(
            height: 10,
          ),

  Text("Dosage:" + " " + cindexno['dosage']),        

      ],)
   ],)
   ),),
//............................................................................................................              
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
Text("Number of proudct:", style: TextStyle(fontFamily: 'JosefinSansBD',fontSize: 20)),
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
          stocks = stock;


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
                      onPressed: () async {

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
                      textColor: Colors.white  
                  );
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
Text("Enter your personal details:", style: TextStyle(fontFamily: 'JosefinSansBD',fontSize: 20)),
// Divider(
//              color: Color.fromARGB(255, 0, 0, 0),
//              thickness: 2,
//              height: 1,
//            ),

Container(
  child: Column(
    children: [
//gap btw borders
          const SizedBox(
            height: 16,
          ),        
//address............................................................................................
          TextField(
                 onChanged: ((value) {
                  address= value;
                }),              
            controller: _address,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: "house name",
              labelText: "Address:",
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
                border: OutlineInputBorder()
            ),

          ),
//gap btw borders
          const SizedBox(
            height: 16,
          ),  
//address2............................................................................................
          TextField(
                 onChanged: ((value) {
                  address2= value;
                }),              
            controller: _address2,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: "street, district, state",
              labelText: "Address 2:",
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
                border: OutlineInputBorder()
            ),

          ),
//gap btw borders
          const SizedBox(
            height: 16,
          ),  
 //pin............................................................................................
          TextField(
            keyboardType: TextInputType.number,
                 onChanged: ((value) {
                  pin= value;
                }),              
            controller: _pin,
            decoration: const InputDecoration(
              hintText: "pin",
              labelText: "Pin:",
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
                border: OutlineInputBorder(),
            ),

          ),
//gap btw borders
          const SizedBox(
            height: 16,
          ),  
 //mobileno............................................................................................
          TextField(
            keyboardType: TextInputType.number,
                 onChanged: ((value) {
                  mobileno= value;
                }),              
            controller: _mobileno,
            decoration: const InputDecoration(
              hintText: "mobile number",
              labelText: "Mobile no:",
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
                border: OutlineInputBorder()
            ),

          ),
//gap btw borders
          const SizedBox(
            height: 16,
          ),                                  

    ]
  )
),
Row(mainAxisAlignment: MainAxisAlignment.center,
  children: [
     ElevatedButton(
      style: ButtonStyle(
       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
      //fixedSize: MaterialStateProperty.all(Size(170, 50)),
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 250, 225, 2))),
      //onPressed: ,
     onPressed: () async { 

          String uname;
           await users.get().then((snapshot) {
           uname = snapshot.get('username');
        });

        int cartempty;
           await iscartempty.get().then((snapshot) {
           cartempty = snapshot.get('stock');
        });

        if (cartempty != 0){


        FirebaseFirestore.instance.collection("ProductSeller").add({
          'images': cindexno['images'],
          'medicine name': cindexno['medicine name'],
          'price': cindexno['price'],
          'date': cindexno['date'],
          'dosage': cindexno['dosage'],
          'nopdt': stocks,
          'address': address,
          'address2': address2,
          'name': uname,
          'pin': pin,
          'mobileno': mobileno,
          'email': user.email,
          'Did': cindexno['email id'],
          'docid': cdocid
        });

        FirebaseFirestore.instance.collection(user.email + "Productbuy").doc(cdocid).set({
          'images': cindexno['images'],
          'medicine name': cindexno['medicine name'],
          'price': cindexno['price'],
          'date': cindexno['date'],
          'dosage': cindexno['dosage'],
          'nopdt': stocks,
          'address': address,
          'address2': address2,
          'name': uname,
          'pin': pin,
          'mobileno': mobileno,
          'email': cindexno['email id'],
          'packed': "Not yet packed",
          'reachedA': "Product on it's way",
          'reachedB': "Product on it's way",
          'arrival': "Product on it's way",
          'delivered': "Product on it's way",
          'pointA': 0,
          'pointB': 0,
          'pointC': 0,
          'pointD': 0,
          'pk': 0,
        });



        FirebaseFirestore.instance.collection("Medicinesell").doc(cdocid).update({
         'stockno': FieldValue.increment(-1),
       });
       FirebaseFirestore.instance.collection(user.email + "cart").doc(cdocid).update({
        'stock': FieldValue.increment(-1),
       });
                       Fluttertoast.showToast(  
                      msg: 'Item purchased',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => buySucess()));             
      
      } else {
                     Fluttertoast.showToast(  
                      msg: 'Cart empty',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white); 
                  }  },     
     child: Row(children: [
      Text("Cash on Delivery", style: TextStyle(color: Colors.black),),
      SizedBox(width: 5,),
      Icon(Icons.local_shipping, color: Colors.black,)
     ]),
     
     ),   

    SizedBox(
      width: 10,
    ),
//Stripe button....................................................................................    

    //  ElevatedButton(
    //   style: ButtonStyle(
    //    shape: MaterialStateProperty.all(RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10))),
    //   //fixedSize: MaterialStateProperty.all(Size(170, 50)),
    //     backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
    //  child: Row(children: [
    //   Text("Online Payment", style: TextStyle(color: Colors.black),),
    //   SizedBox(width: 5,),
    //   Icon(Icons.payment, color: Colors.black,)
    //  ]),
    //  onPressed: () async { 
    //   await makePayment();
    //  }
    //  ),
//gpay....................................................................................    
      GooglePayButton(
        paymentConfigurationAsset: 'gpay.json',
        paymentItems: _paymentItems,
        width: 150,
        height: 40,
        style: GooglePayButtonStyle.white,
        type: GooglePayButtonType.pay,
        margin: const EdgeInsets.only(top: 0.0),
        // onPressed: () async{
          

        // },
        onPaymentResult: (data) async{
                    print(data);
                     Fluttertoast.showToast(  
                      msg: data.toString(),  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white); 
//........................................................................................                      
          String uname1;
           await users.get().then((snapshot) {
           uname1 = snapshot.get('username');
        });

        int cartempty1;
           await iscartempty.get().then((snapshot) {
           cartempty1 = snapshot.get('stock');
        });

        if (cartempty1 != 0){


        FirebaseFirestore.instance.collection("ProductSeller").add({
          'images': cindexno['images'],
          'medicine name': cindexno['medicine name'],
          'price': cindexno['price'],
          'date': cindexno['date'],
          'dosage': cindexno['dosage'],
          'nopdt': stocks,
          'address': address,
          'address2': address2,
          'name': uname1,
          'pin': pin,
          'mobileno': mobileno,
          'email': user.email,
          'Did': cindexno['email id'],
          'docid': cdocid
        });

        FirebaseFirestore.instance.collection(user.email + "Productbuy").doc(cdocid).set({
          'images': cindexno['images'],
          'medicine name': cindexno['medicine name'],
          'price': cindexno['price'],
          'date': cindexno['date'],
          'dosage': cindexno['dosage'],
          'nopdt': stocks,
          'address': address,
          'address2': address2,
          'name': uname1,
          'pin': pin,
          'mobileno': mobileno,
          'email': cindexno['email id'],
          'packed': "Not yet packed",
          'reachedA': "Product on it's way",
          'reachedB': "Product on it's way",
          'arrival': "Product on it's way",
          'delivered': "Product on it's way",
          'pointA': 0,
          'pointB': 0,
          'pointC': 0,
          'pointD': 0,
          'pk': 0,
        });



        FirebaseFirestore.instance.collection("Medicinesell").doc(cdocid).update({
         'stockno': FieldValue.increment(-1),
       });
       FirebaseFirestore.instance.collection(user.email + "cart").doc(cdocid).update({
        'stock': FieldValue.increment(-1),
       });
                       Fluttertoast.showToast(  
                      msg: 'Item purchased',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => buySucess()));             
      
      } else {
                     Fluttertoast.showToast(  
                      msg: 'Cart empty',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white); 
                  } 
//................................................................................
        },
        loadingIndicator: const Center(
          child: CircularProgressIndicator(color: Colors.deepPurple,),
        ),
      ),

    ]),
  SizedBox(
      height: 10,
    ),
      
    
  ])
    ));
}
//stripe..............................................................................................................
//  Future<void> makePayment() async {
//     try {

//       paymentIntentData =
//       await createPaymentIntent(cindexno['price'], 'USD'); //json.decode(response.body);
//       // print('Response body==>${response.body.toString()}');
//       await Stripe.instance.initPaymentSheet(
//           paymentSheetParameters: SetupPaymentSheetParameters(
//               paymentIntentClientSecret: paymentIntentData['client_secret'],
//               applePay: true,
//               googlePay: true,
//               testEnv: true,
//               style: ThemeMode.dark,
//               merchantCountryCode: 'US',
//               merchantDisplayName: 'ANNIE')).then((value){
//       });


//       ///now finally display payment sheeet
//       displayPaymentSheet();
//     } catch (e, s) {
//       print('exception:$e$s');
//     }
//   }

//   displayPaymentSheet() async {

//     try {
//       await Stripe.instance.presentPaymentSheet(
//           parameters: PresentPaymentSheetParameters(
//             clientSecret: paymentIntentData['client_secret'],
//             confirmPayment: true,
//           )).then((newValue) async{


//         print('payment intent'+paymentIntentData['id'].toString());
//         print('payment intent'+paymentIntentData['client_secret'].toString());
//         print('payment intent'+paymentIntentData['amount'].toString());
//         print('payment intent'+paymentIntentData.toString());
//         //orderPlaceApi(paymentIntentData!['id'].toString());
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("paid successfully")));

// //........................................................................................................  
//  //........................................................................................                      
//           String uname1;
//            await users.get().then((snapshot) {
//            uname1 = snapshot.get('username');
//         });

//         int cartempty1;
//            await iscartempty.get().then((snapshot) {
//            cartempty1 = snapshot.get('stock');
//         });

//         if (cartempty1 != 0){


//         FirebaseFirestore.instance.collection("ProductSeller").add({
//           'images': cindexno['images'],
//           'medicine name': cindexno['medicine name'],
//           'price': cindexno['price'],
//           'date': cindexno['date'],
//           'dosage': cindexno['dosage'],
//           'nopdt': stocks,
//           'address': address,
//           'address2': address2,
//           'name': uname1,
//           'pin': pin,
//           'mobileno': mobileno,
//           'email': user.email,
//           'Did': cindexno['email id'],
//           'docid': cdocid
//         });

//         FirebaseFirestore.instance.collection(user.email + "Productbuy").doc(cdocid).set({
//           'images': cindexno['images'],
//           'medicine name': cindexno['medicine name'],
//           'price': cindexno['price'],
//           'date': cindexno['date'],
//           'dosage': cindexno['dosage'],
//           'nopdt': stocks,
//           'address': address,
//           'address2': address2,
//           'name': uname1,
//           'pin': pin,
//           'mobileno': mobileno,
//           'email': cindexno['email id'],
//           'packed': "Not yet packed",
//           'reachedA': "Product on it's way",
//           'reachedB': "Product on it's way",
//           'arrival': "Product on it's way",
//           'delivered': "Product on it's way",
//           'pointA': 0,
//           'pointB': 0,
//           'pointC': 0,
//           'pointD': 0,
//           'pk': 0,
//         });



//         FirebaseFirestore.instance.collection("Medicinesell").doc(cdocid).update({
//          'stockno': FieldValue.increment(-1),
//        });
//        FirebaseFirestore.instance.collection(user.email + "cart").doc(cdocid).update({
//         'stock': FieldValue.increment(-1),
//        });
//                        Fluttertoast.showToast(  
//                       msg: 'Item purchased',  
//                       toastLength: Toast.LENGTH_LONG,  
//                       gravity: ToastGravity.BOTTOM,  
//                       //timeInSecForIosWeb: 1,  
//                       backgroundColor: Colors.black,  
//                       textColor: Colors.white  
//                   );
//       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => buySucess()));             
      
//       } else {
//                      Fluttertoast.showToast(  
//                       msg: 'Cart empty',  
//                       toastLength: Toast.LENGTH_LONG,  
//                       gravity: ToastGravity.BOTTOM,  
//                       //timeInSecForIosWeb: 1,  
//                       backgroundColor: Colors.black,  
//                       textColor: Colors.white); 
//                   } 
// //................................................................................     
// //........................................................................................................
//         paymentIntentData = null;

//       }).onError((error, stackTrace){
//         print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
//       });


//     } on StripeException catch (e) {
//       print('Exception/DISPLAYPAYMENTSHEET==> $e');
//       showDialog(
//           context: context,
//           builder: (_) => AlertDialog(
//             content: Text("Cancelled "),
//           ));
//     } catch (e) {
//       print('$e');
//     }
//   }

//   //  Future<Map<String, dynamic>>
//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(cindexno['price']),
//         'currency': currency,
//         'payment_method_types[]': 'card'
//       };
//       print(body);
//       var response = await http.post(
//           Uri.parse('https://api.stripe.com/v1/payment_intents'),
//           body: body,
//           headers: {
//             'Authorization':
//             'Bearer your token',
//             'Content-Type': 'application/x-www-form-urlencoded'
//           });
//       print('Create Intent reponse ===> ${response.body.toString()}');
//       return jsonDecode(response.body);
//     } catch (err) {
//       print('err charging user: ${err.toString()}');
//     }
//   }

//   calculateAmount(String amount) {
//     final a = (int.parse(amount)) * 100 ;
//     return a.toString();
//   }



}