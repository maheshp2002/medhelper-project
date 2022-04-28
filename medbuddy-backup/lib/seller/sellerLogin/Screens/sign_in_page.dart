import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medbuddy/seller/DataFeed.dart';
import 'package:medbuddy/seller/sellerLogin/services/FirebaseService.dart';
import 'package:medbuddy/seller/sellerLogin/utils/constants.dart';
import 'package:permission_handler/permission_handler.dart';


class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    OutlineInputBorder border = OutlineInputBorder(
        borderSide: BorderSide(color: Constants.kBorderColor, width: 3.0));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Constants.kPrimaryColor,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("assets/sign-in.png", width: 300,height: 300),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: Constants.textSignInTitle,
                    style: TextStyle(
                      color: Constants.kBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    )),
              ])),
          SizedBox(height: size.height * 0.01),
          Text(
            Constants.textSmallSignIn,
            style: TextStyle(color: Constants.kDarkGreyColor),
          ),
          GoogleSignIn(),
     /*       buildRowDivider(size: size),
          Padding(padding: EdgeInsets.only(bottom: size.height * 0.02)),
        SizedBox(
            width: size.width * 0.8,
            child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    enabledBorder: border,
                    focusedBorder: border)),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                enabledBorder: border,
                focusedBorder: border,
                suffixIcon: Padding(
                  child: FaIcon(
                    FontAwesomeIcons.eye,
                    size: 15,
                  ),
                  padding: EdgeInsets.only(top: 15, left: 15),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: size.height * 0.05)),
          SizedBox(
            width: size.width * 0.8,
            child: OutlinedButton(
              onPressed: () async {},
              child: Text(Constants.textSignIn),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Constants.kPrimaryColor),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Constants.kBlackColor),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
            ),
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: Constants.textAcc,
                    style: TextStyle(
                      color: Constants.kDarkGreyColor,
                    )),
                TextSpan(
                    text: Constants.textSignUp,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.kDarkBlueColor,
                    )),
              ])),*/
        ])));
  }

  /*Widget buildRowDivider({Size size}) {
    return SizedBox(
      width: size.width * 0.8,
      child: Row(children: <Widget>[
        Expanded(child: Divider(color: Constants.kDarkGreyColor)),
        Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              "Or",
              style: TextStyle(color: Constants.kDarkGreyColor),
            )),
        Expanded(child: Divider(color: Constants.kDarkGreyColor)),
      ]),
    );
  }*/
}

class GoogleSignIn extends StatefulWidget {
  GoogleSignIn({Key key}) : super(key: key);

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  !isLoading? SizedBox(
      width: size.width * 0.8,
      child: OutlinedButton.icon(
        icon: FaIcon(FontAwesomeIcons.google),
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          FirebaseService service = new FirebaseService();
          try {
//sign in....................................................................................            
           await service.signInwithGoogle();
 //Naigate to next page......................................................................          
           Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DataFeed()));
 //Permission request........................................................................          
           Map<Permission, PermissionStatus> statuses = await [
                Permission.location, 
                 Permission.camera,
                        //add more permission to request here.
                ].request();
                     
              if(statuses[Permission.location].isDenied){ //check each permission status after.
                print("Location permission is denied.");
                }

              if(statuses[Permission.camera].isDenied){ //check each permission status after.
                          print("Camera permission is denied.");
                      }
  //toast..........................................................................                    
                      Fluttertoast.showToast(  
                      msg: 'This Page stores Location,so turn on your location',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );  
          } catch(e){
            if(e is FirebaseAuthException){
              showMessage(e.message);
            }
          }
          setState(() {
            isLoading = false;
          });
        },
        label: Text(
          Constants.textSignInGoogle,
          style: TextStyle(
              color: Constants.kBlackColor, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Constants.kGreyColor),
            side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
      ),
    ) : CircularProgressIndicator();
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}