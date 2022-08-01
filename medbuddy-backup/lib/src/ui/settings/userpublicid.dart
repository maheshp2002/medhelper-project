import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/settings/userpublicprsucess.dart';



class userpublicid extends StatefulWidget {
  const userpublicid({ Key key}) : super(key: key);

  @override
  DataState createState() => DataState();
}

class DataState extends State<userpublicid>{
final collectionReference = FirebaseFirestore.instance.collection("UserpublicID");



//Controller
final TextEditingController _name = TextEditingController();
final TextEditingController _age = TextEditingController();
final TextEditingController _issue = TextEditingController();
final TextEditingController _mobileno = TextEditingController();


String name;
String age;
String issue;
String mobileno;
bool isLoadingDF = false;


//..........................................................................................
Future<String> uploadFile(_image) async {

            FirebaseStorage storage = FirebaseStorage.instance;
              Reference ref = storage.ref().child(user.email + "user" + DateTime.now().toString());
              await ref.putFile(File(_image.path));
              String returnURL = await ref.getDownloadURL();
              return returnURL;
            }

//LOCATION
//getCurrentLocation() async {
  Future<void> saveImages(File _image) async {

               
              //_image.forEach((image) async {
            

            String imageURL = await uploadFile(_image);


               
//..........................................................................................

//Firebase data write
                   await collectionReference.doc(user.email).set(
                        {
                        'age':age,
                        'User name':name,
                        'mobile no':mobileno,
                        'images': imageURL,
                        'Did':user.email,
                        'issue': issue,
                        'token': 0,
                        },
                        );
           setState(() {
            isLoadingDF = false;
          });
              
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

  @override
  Widget build(BuildContext context) {
  return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title:  const Text("Add profile"),
        elevation: 16.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white, 
              ),
              onPressed: () {
               Navigator.pop(context);
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

//name.............................................................................................
          TextField(
                onChanged: ((value) {
                  name = value;
                }),            
            controller: _name,
              decoration: const InputDecoration(
                  hintText: "name",
                  labelText: "Name:",
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                  ),
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.name,
            maxLength: 30,
          ),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
//specialization............................................................................................
          TextField(
                 onChanged: ((value) {
                  age= value;
                }),              
            controller: _age,
            decoration: const InputDecoration(
              hintText: "age",
              labelText: "Age:",
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
                border: OutlineInputBorder()
            ),
            keyboardType: TextInputType.number,

          ),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
//mobileno.............................................................................................
          TextField(
                 onChanged: ((value) {
                  mobileno= value;
                }),             
            controller: _mobileno,
            decoration: const InputDecoration(
                hintText: "mobileno",
                labelText: "Mobileno:",
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

          TextField(
                  onChanged: ((value) {
                  issue=value;
                }),            
            controller: _issue,
            decoration: const InputDecoration(
                hintText: "Health issues",
                labelText: "Health issues:",
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
              await saveImages(_image);

              Fluttertoast.showToast(  
                      msg: 'Public profile created',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 
                Navigator.push(context, MaterialPageRoute(builder: (context)=> userpublicprsucess()));
                
                
              
                 
                  _name.clear();         
                  _mobileno.clear();
                  _age.clear();  
                  _issue.clear();  
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
      ):Container(

      color: Colors.white,
      child: Center(
      
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Image.asset('assets/splash/plaster.gif'),
            //SizedBox(height: 10),
          Container(width:100, height: 50,
          alignment: Alignment.center,
            child:
            AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Loading...',
                        textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                        speed: const Duration(milliseconds: 600)
                        ),
                    WavyAnimatedText('Please wait...',
                        textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        speed: const Duration(milliseconds: 600)
                        ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                 // onTap: () {
                   // print("Tap Event");
                  //},
                ),),

      ])
      ))

);
  }
 
}
