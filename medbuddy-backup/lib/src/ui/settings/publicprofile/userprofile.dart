import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/settings/publicprofile/userpublicprofile.dart';
import 'package:medbuddy/src/ui/settings/userpublicid.dart';


class userprofile extends StatefulWidget {
  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<userprofile>{
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

            Padding(padding: EdgeInsets.only(left: 10, right: 10,),
              child: Material(
                color: Colors.white,
                elevation: 18,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.grey,
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                    => userpublicprofile()
                  ));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(image: AssetImage('assets/logo/girluser.png'),
                        height: 180,
                        width: 200,
                        fit: BoxFit.fill,

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
                      return userpublicid();
                    }));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(image: AssetImage('assets/logo/adduser.png'),
                        height: 160,
                        width: 200,
                        fit: BoxFit.fill,

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