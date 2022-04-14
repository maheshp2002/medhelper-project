import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/seller/sellerLogin/Screens/welcome_screen.dart';
import 'package:medbuddy/seller/sellerLogin/services/FirebaseService.dart';


class doctorHomePage extends StatefulWidget {
  doctorHomePage({Key key}) : super(key: key);

  @override
  _doctorHomePageState createState() => _doctorHomePageState();
}

class _doctorHomePageState extends State<doctorHomePage> {
  String prescription;
  String emailid;
   TextEditingController prescriptionController = TextEditingController();
   TextEditingController emailidController = TextEditingController();
  final collectionReference = FirebaseFirestore.instance;
 // User user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
               FirebaseService service = new FirebaseService();
                await service.signOutFromGoogle();
               Navigator.of(context).pop(MaterialPageRoute(builder: (ctx) => WelcomeScreen()));
              },
            )
          ],
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.blue),
          title: Text("Home"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(child:
            Text("Enter Prescription here:", textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),),
            Flexible(
              child:TextField(
               onChanged: ((value) {
                  prescription = value;
                }),
            controller: prescriptionController,
            keyboardType: TextInputType.multiline,
            maxLines: 20,
          ),),
          Flexible(child:
            Text("Enter email ID:", textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),),
            Flexible(
              child:TextField(
               onChanged: ((value) {
                  emailid = value;
                }),
            controller: emailidController,
            keyboardType: TextInputType.emailAddress,
            
          ),),
          Flexible(child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                  width: 220,
                  height: 70,
                  child: FlatButton(
                    color: Color(0xFF3EB16F),
                    shape: StadiumBorder(),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    onPressed: () async{
                      Fluttertoast.showToast(  
                      msg: 'Prescription Added',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 
                      await collectionReference.collection(emailid).add(
                        {
                        'prescription':prescription,}, 
                        );
                        prescriptionController.clear();
                        emailidController.clear();
                        }
                        
                        )
                        )),),
          ],
        ));
  }
}