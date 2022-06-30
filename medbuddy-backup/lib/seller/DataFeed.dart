import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:medbuddy/seller/sellerLogin/utils/sellerNavBar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medbuddy/seller/splash_screen/sellerSplash.dart';



class DataFeed extends StatefulWidget {
  const DataFeed({ Key key}) : super(key: key);

  @override
  DataState createState() => DataState();
}

class DataState extends State<DataFeed>{
User user = FirebaseAuth.instance.currentUser;
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
final TextEditingController _lat= TextEditingController();
final TextEditingController _long= TextEditingController();
final TextEditingController _expire= TextEditingController();
final TextEditingController _stockno = TextEditingController();


String id;
double lat;
int stockno;
double long;
String name;
String dosage;
String emailID;
String address;
String mobileno;
String storename;
String expire;
bool isLoadingDF = false;

//String stock;
String price;
String discountvalue;
bool hasDiscount;
bool clocation;
GeoPoint cloc;
String datenow1 = DateFormat("yyyy-MM-dd").format(DateTime.now());

//...........................................................................................
//for date
Datepicker() async {
DateTime pickedDate = await showDatePicker(
    context: context, //context of current state
    initialDate: DateTime.now(),
    firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
    lastDate: DateTime(2101)
);

if(pickedDate != null ){
    print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    print(formattedDate); //formatted date output using intl package =>  2021-03-16
}else{
    print("Date is not selected");
}
}
//...........................................................................................

//..........................................................................................
Future<String> uploadFile(_image) async {

            FirebaseStorage storage = FirebaseStorage.instance;
              Reference ref = storage.ref().child(user.email + "1" + DateTime.now().toString());
              await ref.putFile(File(_image.path));
              String returnURL = await ref.getDownloadURL();
              return returnURL;
            }

//..........................................................................................
Future<String> uploadFile1(_image1) async {

            FirebaseStorage storage = FirebaseStorage.instance;
              Reference ref = storage.ref().child(user.email + "2" + DateTime.now().toString());
              await ref.putFile(File(_image1.path));
              String returnURL = await ref.getDownloadURL();
              return returnURL;
            }

//..........................................................................................
Future<String> uploadFile2(_image2) async {

            FirebaseStorage storage = FirebaseStorage.instance;
              Reference ref = storage.ref().child(user.email + "3" + DateTime.now().toString());
              await ref.putFile(File(_image2.path));
              String returnURL = await ref.getDownloadURL();
              return returnURL;
            }

//..........................................................................................
//LOCATION
//getCurrentLocation() async {
  Future<void> saveImages(File _image, File _image1, File _image2) async {
  Position position;
  if(clocation == true){
  position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high);
    cloc= GeoPoint(position.latitude, position.longitude);
  }else{
    cloc = GeoPoint(lat, long);
  }
//....................................................................
               
              //_image.forEach((image) async {
              String imageURL = await uploadFile(_image);
              String imageURL1 = await uploadFile(_image1);
              String imageURL2 = await uploadFile(_image2);
               
//..........................................................................................
         
        double oldprice;
        double discountv;
        double discount;
        String DiscountVal;
        String returnStr;
        if(hasDiscount == true){
        oldprice = double.parse(price);
        discountv = double.parse(discountvalue);
        discount = 0.0;
        returnStr = discount.toString();

        discount = (oldprice - discountv)/oldprice*100;
        returnStr = discount.toStringAsFixed(0);
        DiscountVal = discountvalue.toString();
        }
        else{
          returnStr = "No discount";
          DiscountVal = price;
        }
        String datenow = datenow1;
//..........................................................................................

//Firebase data write
        if(id!=null && name!=null && address!=null && storename!=null && emailID!=null && price!=null)
          {
                await collectionReference.add(
                        {
                        'ID':id,
                        'medicine name':name,
                        'dosage':dosage,
                        'address':address,
                        'store name':storename,
                        'price':DiscountVal,
                        'discount %':returnStr,
                        'discount price':price,
                        'mobile no':mobileno,
                        'email id':emailID,
                        'Latitude': cloc,
                        'images': imageURL,
                        'images1': imageURL1,
                        'images2': imageURL2,
                        'date' : datenow,
                        'Did':user.email,
                        'expire': expire,
                        'stockno': stockno,
                        },
                        );
           setState(() {
            isLoadingDF = false;
          });
          }else{
               return Fluttertoast.showToast(  
                      msg: 'Please check if all data is entered',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 
          }
                //}
                //);
              
              
            
//...........................................................................................
}


// Image Picker
  //List<File> _images = [];
  File _image; // Used only if you need a single picture
  File _image1; // Used only if you need a single picture
  File _image2; // Used only if you need a single picture

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
//........................................................................................

  Future getImage1(bool gallery) async {
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
        _image1 = File(pickedFile.path); // Use if you only need a single picture
      } else {
        print('No image selected.');
      }
    });
  }

//..........................................................................................

    Future getImage2(bool gallery) async {
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
        _image2 = File(pickedFile.path); // Use if you only need a single picture
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
        backgroundColor: Colors.deepPurple,
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
      body:  !isLoadingDF? Column(
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
                  hintText: "eg:- pill, tablet, syringe, bottle",
                  labelText: "Tag:",
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                  ),
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.name,
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
//expire.............................................................................................
              TextField(
                controller: _expire, //editing controller of this TextField
                decoration: InputDecoration( 
                   icon: Icon(Icons.calendar_today), //icon of text field
                   labelText: "Expire date" //label text of field
                ),
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );
                  
                  if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      expire = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      //print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                         _expire.text = expire; //set output date to TextField value. 
                      });
                  }else{
                      print("Date is not selected");
                  }
                },
            
          ),

//gap btw borders
          const SizedBox(
            height: 16,
          ),
//stock.............................................................................................
          TextField(
                 onChanged: ((value) {
                  stockno= int.parse(value);
                }),             
            controller: _stockno,
            decoration: const InputDecoration(
                hintText: "No. of stock",
                labelText: "Stock:",
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
//gap btw borders
            Row(children: [
          Icon(Icons.warning_amber_outlined,color: Colors.grey,size: 10,),
          Text("Note: If no, No need to enter New price.",
          style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans',fontSize: 10),),
            ]),
            const SizedBox(
              height: 10,
            ),
Row(mainAxisAlignment: MainAxisAlignment.start,
  children: [
          Row(
            children:[
          SizedBox(
          width: 10,
        ), 
          Text("Discount:",textAlign: TextAlign.left,style: TextStyle(fontSize: 15),),  
          SizedBox(
          width: 20,
        ),           
           Radio(
            value: true,
            groupValue: hasDiscount,
            onChanged: (value) {
              setState(() {
                hasDiscount = value;
                print(hasDiscount);
              });
            },
          ),
           const Text('Yes'),
        ]),
        SizedBox(
          width: 30,
        ),
          Row(
            children:[
           Radio(
            value: false,
            groupValue: hasDiscount,
            onChanged: (value) {
              setState(() {
                hasDiscount = value;
                print(hasDiscount);
              });
            },
          ),
           const Text('No'),
            ]),
  ]
),
          const SizedBox(
            height: 16,
          ),
//Row(children: [
          TextField(
                  onChanged: ((value) {
                  discountvalue= value;
                }),            
            controller: _discount,
            decoration: const InputDecoration(
                hintText: "new price",
                labelText: "New price:",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: OutlineInputBorder()
            ),

            maxLength: 15,
            keyboardType: TextInputType.number,
          ),
//location
Row(mainAxisAlignment: MainAxisAlignment.start,
  children: [
          Row(
            children:[
          SizedBox(
          width: 10,
        ), 
          Text("Store location:",textAlign: TextAlign.left,style: TextStyle(fontSize: 15),),  
          SizedBox(
          width: 5,
        ),           
           Radio(
            value: true,
            groupValue: clocation,
            onChanged: (value) {
              setState(() {
                clocation = value;
                //print(hasDiscount);
              });
            },
          ),
           const Text('Current loc',style: TextStyle(fontSize: 10),),
        ]),
        SizedBox(
          width: 5,
        ),
          Row(
            children:[
           Radio(
            value: false,
            groupValue: clocation,
            onChanged: (value) {
              setState(() {
                clocation = value;
                //print(hasDiscount);
              });
            },
          ),
           const Text('Input lat/long',style: TextStyle(fontSize: 10),),
            ]),
  ]
),
          const SizedBox(
            height: 16,
          ),
            Row(children: [
          Icon(Icons.warning_amber_outlined,color: Colors.grey,size: 10,),
          Text("Note: No need to enter lat/long when current location on.",
          style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans',fontSize: 10),),
            ]),
            const SizedBox(
              height: 10,
            ),
//lat
          TextField(
                  onChanged: ((value) {
                  lat= double.parse(value);
                }),            
            controller: _lat,
            decoration: const InputDecoration(
                hintText: "Latitude",
                labelText: "Latitude:",
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
 //long         
          TextField(
                  onChanged: ((value) {
                  long= double.parse(value);
                }),            
            controller: _long,
            decoration: const InputDecoration(
                hintText: "Longitude",
                labelText: "Longitude:",
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
/*RawMaterialButton(
          fillColor: Theme.of(context).accentColor,
          child: Icon(Icons.add_photo_alternate_rounded,
          color: Colors.white,),
          elevation: 8,
          onPressed: () {
            getImage(true);
          },
          padding: EdgeInsets.all(15),
         shape: CircleBorder(),
),*/
//..........................................................................................

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 

              GestureDetector(
              onTap: () {
                 getImage(true);
              },
              child: Container(
                //radius: 55,
              height: 150.0,
                width: 150.0,
                color: Colors.grey[200],
                child: _image != null
                    ? ClipRRect(
                        //borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          _image,
                          width: 150,
                          height: 150,
                          fit: BoxFit.fill
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),

//..........................................................................................
SizedBox(width: 10,),

              GestureDetector(
              onTap: () {
                 getImage1(true);
              },
              child: Container(
                //radius: 55,
              height: 150.0,
                width: 150.0,
                color: Colors.grey[200],
                child: _image1 != null
                    ? ClipRRect(
                        //borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          _image1,
                          width: 150,
                          height: 150,
                          fit: BoxFit.fill
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ]),
//..........................................................................................
SizedBox(height: 10,),

        Center(
            child:  GestureDetector(
              onTap: () {
                 getImage2(true);
              },
              child: Container(
                //radius: 55,
              height: 150.0,
                width: 150.0,
                color: Colors.grey[200],
                child: _image2 != null
                    ? ClipRRect(
                        //borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          _image2,
                          width: 150,
                          height: 150,
                          fit: BoxFit.fill
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),),
//..........................................................................................



//gap btw borders
            const SizedBox(
              height: 16,
            ),

 

//Submit Button
          ElevatedButton(
           
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple)),
          child: const Text('Submit', style: TextStyle(color: Colors.white),),
           onPressed: () async{
           setState(() {
            isLoadingDF = true;
          });
              //uploadFile(_image);
              await saveImages(_image, _image1, _image2);

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
              
          ),
          //gap btw borders
            const SizedBox(
              height: 10,
            ),
            Row(children: [
          Icon(Icons.warning_amber_outlined,color: Colors.grey,size: 10,),
          Text("Note: Data upload take some time so please be patient",
          style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans',fontSize: 10),),
            ]),
          Text("only click submit button once,if not uploaded for 20sec check if all data are given",
          style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans',fontSize: 10),),
        ],
      ),
          ),
            ],
        ),
  ),
    ],
      ):Center(
      
      child: Image.asset('assets/splash/loading.gif'),),


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