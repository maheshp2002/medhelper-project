import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medbuddy/seller/sellerLogin/utils/sellerNavBar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medbuddy/seller/splash_screen/sellerSplash.dart';



class DataFeed extends StatefulWidget {
  const DataFeed({ Key key}) : super(key: key);

  @override
  DataState createState() => DataState();
}

class DataState extends State<DataFeed>{

final collectionReference = FirebaseFirestore.instance.collection("Medicinesell");


//Controller
final TextEditingController _id = TextEditingController();
final TextEditingController _name = TextEditingController();
final TextEditingController _dosage = TextEditingController();
final TextEditingController _price = TextEditingController();
final TextEditingController _emailID = TextEditingController();
final TextEditingController _address = TextEditingController();
final TextEditingController _mobileno = TextEditingController();
final TextEditingController _storename = TextEditingController();
final TextEditingController _discount= TextEditingController();

String id;
String name;
String dosage;
String emailID;
String address;
String mobileno;
String storename;


String price;
String discountvalue;

//..........................................................................................
Future<String> uploadFile(_image) async {

            FirebaseStorage storage = FirebaseStorage.instance;
              Reference ref = storage.ref().child("image" + DateTime.now().toString());
              await ref.putFile(File(_image.path));
              String returnURL = await ref.getDownloadURL();
              return returnURL;
            }

//..........................................................................................
//LOCATION
//getCurrentLocation() async {
  Future<void> saveImages(File _image) async {

  Position position;
  position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high);
//....................................................................
               
              //_image.forEach((image) async {
              String imageURL = await uploadFile(_image);
               
//..........................................................................................
         
        double oldprice = double.parse(price);
        double discountv = double.parse(discountvalue);
        double discount = 0.0;
        String returnStr = discount.toString();

        discount = (oldprice - discountv)/oldprice*100;
        returnStr = discount.toStringAsFixed(4);

//..........................................................................................

//Firebase data write
                await collectionReference.add(
                        {
                        'ID':id,
                        'medicine name':name,
                        'dosage':dosage,
                        'address':address,
                        'store name':storename,
                        'price':price.toString(),
                        'discount %':returnStr,
                        'discount price':discountvalue.toString(),
                        'mobile no':mobileno,
                        'email id':emailID,
                        'Latitude': GeoPoint(position.latitude, position.longitude),
                        'images': imageURL,
                        },
                        );
                //}
                //);
              
              
            
//...........................................................................................
}


// Image Picker
  //List<File> _images = [];
  File _image; // Used only if you need a single picture

  Future getImage(bool gallery) async {
    ImagePicker picker = ImagePicker();
    PickedFile pickedFile;
    // Let user select photo from gallery
    if(gallery) {
      pickedFile = await picker.getImage(
          source: ImageSource.gallery,maxWidth: 150, maxHeight: 150);
    } 
    // Otherwise open camera to get new photo
    else{
      pickedFile = await picker.getImage(
          source: ImageSource.camera,);
    }

    setState(() {
      if (pickedFile != null) {
        //_images.add(File(pickedFile.path));
        _image = File(pickedFile.path); // Use if you only need a single picture
      } else {
        print('No image selected.');
      }
    });
  }

//..........................................................................................
//   var newPrice = 0.0;
//   var savedAmount = 0.0;
//   double originalPrice;
//   double discount;
// void _calculateDiscount() {
//     setState(() {
//       savedAmount = originalPrice * discount;
//       newPrice = originalPrice - (originalPrice * discount);
//     });
//     print(newPrice);
// }
//..........................................................................................

    // String calDiscount() {
    //     double oldprice = double.parse(price);
    //     double discountv = double.parse(discountvalue);
    //     double discount = 0.0;
    //     returnStr = discount.toString();

    //     discount = (oldprice - discountv)/oldprice*100;
    //     returnStr = discount.toStringAsFixed(4);

    //     return returnStr;
    // }

//..........................................................................................
  @override
  Widget build(BuildContext context) {
  return Scaffold(
       drawer: sellerNavBar(),
        appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        title:  const Text("Home"),
        elevation: 16.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white, 
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            
            );
          },
        ),),
//page UI.....................................................................................
      body: Column(
    children: [
      Flexible(
        child: ListView(
            children: [
          Padding(padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),

     child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

//id.............................................................................................
          TextField(
                onChanged: ((value) {
                  id = value;
                }),            
            controller: _id,
              decoration: const InputDecoration(
                  hintText: "pill, tablet, syringe, bottle",
                  labelText: "Tag:",
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                  ),
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
            maxLength: 10,
          ),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
//name............................................................................................
          TextField(
                 onChanged: ((value) {
                  name= value;
                }),              
            controller: _name,
            decoration: const InputDecoration(
              hintText: "medicine name",
              labelText: "Medicine name:",
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
//dosage.............................................................................................
          TextField(
                 onChanged: ((value) {
                  dosage= value;
                }),             
            controller: _dosage,
            decoration: const InputDecoration(
                hintText: "Dosage",
                labelText: "Dosage:",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: OutlineInputBorder()
            ),

            maxLength: 15,
            keyboardType: TextInputType.number,
          ),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
//Address............................................................................................
          TextField(
                  onChanged: ((value) {
                  address=value;
                }),            
            controller: _address,
            decoration: const InputDecoration(
                hintText: "Address",
                labelText: "Address:",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: UnderlineInputBorder()
            ),

            maxLines: 3,
          ),

//gap btw borders
          const SizedBox(
            height: 16,
          ),
//Store name.....................................................................................
          TextField(
                  onChanged: ((value) {
                  storename=value;
                }),            
            controller: _storename,
            decoration: const InputDecoration(
                hintText: "Store name",
                labelText: "Store name:",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: UnderlineInputBorder()
            ),

            maxLines: 3,
          ),

//gap btw borders
          const SizedBox(
            height: 16,
          ),          
//price.............................................................................................
          TextField(
                  onChanged: ((value) {
                  price= value;
                }),            
            controller: _price,
            decoration: const InputDecoration(
                hintText: "price",
                labelText: "Price:",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: OutlineInputBorder()
            ),

            maxLength: 15,
            keyboardType: TextInputType.number,
          ),
//gap btw borders
          const SizedBox(
            height: 16,
          ),

//discount.........................................................................................
//Row(children: [
          TextField(
                  onChanged: ((value) {
                  discountvalue= value;
                }),            
            controller: _discount,
            decoration: const InputDecoration(
                hintText: "discount value(new value)",
                labelText: "Discount price:",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: OutlineInputBorder()
            ),

            maxLength: 15,
            keyboardType: TextInputType.number,
          ),

//gap btw borders
          const SizedBox(
            height: 16,
          ),

          //TextField(            
          //   decoration: const InputDecoration(
                
          //       labelText: "Discount %:",
          //       labelStyle: TextStyle(
          //           fontSize: 15,
          //           color: Colors.black
          //       ),
          //       border: OutlineInputBorder()
          //   ),

          //   maxLength: 15,
          //   keyboardType: TextInputType.number,
          // ),
          
//]),
//gap btw borders
          const SizedBox(
            height: 16,
          ),


//mobile no
          TextField(
                  onChanged: ((value) {
                  mobileno= value;
                }),            
            controller: _mobileno,
            decoration: const InputDecoration(
                hintText: "Mobile Number",
                labelText: "Mobile No:",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: OutlineInputBorder()
            ),

            maxLength: 15,
            keyboardType: TextInputType.number,
          ),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
//emailID
          TextField(
                  onChanged: ((value) {
                  emailID= value;
                }),            
            controller: _emailID,
            decoration: const InputDecoration(
                hintText: "email ID",
                labelText: "Email-ID:",
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

 //Image selection
RawMaterialButton(
          fillColor: Theme.of(context).accentColor,
          child: Icon(Icons.add_photo_alternate_rounded,
          color: Colors.white,),
          elevation: 8,
          onPressed: () {
            getImage(true);
          },
          padding: EdgeInsets.all(15),
         shape: CircleBorder(),
),


//gap btw borders
            const SizedBox(
              height: 16,
            ),

 

//Submit Button
          ElevatedButton(
           
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
          child: const Text('Submit', style: TextStyle(color: Colors.white),),
           onPressed: () async{
              uploadFile(_image);
              await saveImages(_image);
              Fluttertoast.showToast(  
                      msg: 'Data Added to DataBase',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 
                Navigator.push(context, MaterialPageRoute(builder: (context)=> sellerSucess()));
                
                
              
                 
                  _id.clear();    
                  _name.clear();         
                  _dosage.clear();
                  _address.clear();
                  _price.clear();
                  _discount.clear();
                  _mobileno.clear();
                  _emailID.clear();
                  _storename.clear();
            }          
              
          )
        ],
      ),
          ),
            ],
        ),
  ),
    ],
      ),


);
  }

 
}



/*              TextField(
                decoration: InputDecoration(
                  hintText: '100',
                  labelText: 'Original Price',
                  suffix: Text("\$"),
                ),
                onChanged: (value) => originalPrice = double.parse(value),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: '20',
                  labelText: 'Discount Percentage',
                  suffix: Text("%"),
                ),
                onChanged: (value) => discount = double.parse(value) / 100,
              ),*/