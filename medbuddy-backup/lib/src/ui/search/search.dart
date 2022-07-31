import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/medicine_webpages/1mg.dart';
import 'package:medbuddy/src/ui/medicine_webpages/netmeds.dart';
import 'package:medbuddy/src/ui/medicine_webpages/pharmeasy.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/home_screen.dart';
import 'package:medbuddy/src/ui/tabpage/tabs.dart';

class search extends StatefulWidget {
  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<search>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tab()),
            );
          },
        ),
      backgroundColor: Colors.deepPurple,
      //Color(0xFF3EB16F),
      elevation: 0.0,
      title: Text(
          "Search",
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

        child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(padding: EdgeInsets.only(left: 10, right: 10),
              child: Material(
                color: Color(0xFF3EB16F),
                elevation: 18,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.lightGreen,
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                    => pharmeasy()
                  ));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(image: AssetImage('assets/logo/pharmeasy.png'),
                        height: 100,
                        width: 150,
                        fit: BoxFit.fitWidth,

                      ),
                        Text(
                          'Pharmeasy',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      SizedBox(height: 10,),                        
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10, right: 10),
              child: Material(
                color: Colors.white,
                elevation: 18,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.lightGreenAccent,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return netmed();
                    }));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(image: AssetImage('assets/logo/netmeds.png'),
                        height: 100,
                        width: 150,
                        fit: BoxFit.fitWidth,

                      ),
                Text(
                      'Netmed',
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
//second Row
      Padding(padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(padding: EdgeInsets.only(left: 10, right: 10),
                child: Material(
                  color: Colors.orange,
                  elevation: 18,
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.orangeAccent,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return tatamg();
                    }));
                  },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(image: AssetImage('assets/logo/1mg.png'),
                          height: 100,
                          width: 150,
                          fit: BoxFit.fitWidth

                        ),
                        Text(
                          '1mg',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                         SizedBox(height: 10,),                       
                      ],
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10, right: 10),
                child: Material(
                  color: Colors.deepPurple,
                  elevation: 18,
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.purpleAccent,
                    onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));                     
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(image: AssetImage('assets/splash/pilllogo.png'),
                          height: 100,
                          width: 150,
                          fit: BoxFit.fitWidth,
                        ),
                        Text(
                          'MedSeller',
                          style: TextStyle(fontSize: 20, color: Colors.white),
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