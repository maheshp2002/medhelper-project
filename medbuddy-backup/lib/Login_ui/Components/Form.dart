import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../src/ui/login page/auth_class.dart';


class FormContainer extends StatelessWidget {
  TextEditingController unameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return (new Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Form(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new TextFormField(
                controller: unameController,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 16,
                ),
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'example@gmail.com',
                  prefixIcon: Icon(Icons.email),
                  border: UnderlineInputBorder(),
                ),
    
              ),
              Padding(padding: EdgeInsets.only(top: 10),
               child:
              new TextFormField(
                controller: passController,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 16,
                ),
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'password',
                  prefixIcon: Icon(Icons.keyboard),
                  border: UnderlineInputBorder(),
                ),
              ),
              ),
              Padding(padding: EdgeInsets.only(top: 20),
               child: RaisedButton(
                 color: Colors.pinkAccent,
                 child: Text("Sign In", style: TextStyle(color: Colors.white),),
        onPressed: (){
          context.read<AuthenticationService>().signIn(
            email: unameController.text.trim(),
            password: passController.text.trim(),
          );
          /*new Text(
        "Sign In",
        style: new TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),*/
        }
               ),
              ),
            ],
          )),
        ],
      ),
    ));
  }
}
