import 'package:flutter/material.dart';
import 'package:medbuddy/doctor/doctorconsult/dconsult.dart';
import 'package:medbuddy/doctor/doctorconsult/dcpublicprofile.dart';


class consult extends StatefulWidget {
  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<consult>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      backgroundColor: Colors.deepPurple,
      //Color(0xFF3EB16F),
      elevation: 0.0,
      title: Text(
          "Public profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      
      backgroundColor: Colors.white,

      body: 
      Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 20),

        child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(padding: EdgeInsets.only(left: 10, right: 10),
              child: Material(
                color: Colors.white,
                elevation: 18,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.grey,
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                    => publicprofileview()
                  ));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(image: AssetImage('assets/logo/dcprofile.png'),
                        height: 150,
                        width: 200,
                        fit: BoxFit.fitWidth,

                      ),
                        Text(
                          'View profile',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      SizedBox(height: 10,),                        
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10, right: 10,top: 20),
              child: Material(
                color: Colors.white,
                elevation: 18,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.lightGreenAccent,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return publicprofile();
                    }));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(image: AssetImage('assets/logo/addprofile.png'),
                        height: 150,
                        width: 200,
                        fit: BoxFit.fitWidth,

                      ),
                Text(
                      'Add profile',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                SizedBox(height: 10,),                    
                    ],

                  ),

                ),
              ),
            ),
      ],
        ),
        ),

  ],


        ),


    ),

    );
  }

}