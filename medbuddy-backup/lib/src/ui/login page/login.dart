import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/login%20page/auth_class.dart';
import 'package:provider/provider.dart';
import '../new_entry/new_entry.dart';
import '../tabpage/tabs.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();

  
}

class _loginState extends State<login>{


  @override
  Widget build(BuildContext context) {
return MultiProvider(
  providers: [
    Provider<AuthenticationService>(
      create: (_) => AuthenticationService(FirebaseAuth.instance),
    ),

    StreamProvider(create: (context) =>context.read<AuthenticationService>().authStateChange,
     ),
  ],

   child: MaterialApp(
     home: AuthenticationWrapper(),

   ),
);
   } 
}
   
class AuthenticationWrapper extends StatelessWidget{
   AuthenticationWrapper({
    Key key,
  }) : super(key: key);



     @override
     Widget build(BuildContext context){
       final firebaseUser = context.watch<User>();

       if(firebaseUser != null){
         return tab();

       } return signinpage();
     }
}
   

class signinpage extends StatelessWidget{
  TextEditingController unameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

    @override
    Widget build(BuildContext context){

  return Scaffold(
  appBar: AppBar(
        backgroundColor: Color(0xFF3EB16F),
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
  backgroundColor: Colors.white,

  body: Container(
    alignment: Alignment.center,
    child: Padding(
    padding: EdgeInsets.only(top: 40),
    child: 
    Column(
      children: [
//for user name
        PanelTitle(
                title: "user Name",
                isRequired: true,
              ),
Padding(
  padding: EdgeInsets.only(left: 10, right: 10),
      child:  TextFormField(
        
                //..........................
               // onChanged: ((value) {
                 // dosage = value;
                //}),
                //............................
                controller: unameController,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 16,
                ),
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'example@gmail.com',
                  border: UnderlineInputBorder(),
                ),
        ),
),
//for password
        PanelTitle(
                title: "password",
                isRequired: true,
              ),
Padding(
  padding: EdgeInsets.only(left: 5, right: 5),
      child:
                TextFormField(
                //..........................
               // onChanged: ((value) {
                 // dosage = value;
                //}),
                //............................
                controller: passController,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 16,
                ),
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'password',
                  border: UnderlineInputBorder(),
                ),
        ),
),

//submit button

      RaisedButton(
        onPressed: (){
          context.read<AuthenticationService>().signIn(
            email: unameController.text.trim(),
            password: passController.text.trim(),
          );
          //Navigator.push(
            //context,
            //MaterialPageRoute(builder: (BuildContext context) =>  tab())
     
          //);

        },
        child: Text("Login"))
      ],
      ),
      ),
  
),
   
   
   
);


  


  }

}

