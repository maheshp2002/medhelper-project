import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:medbuddy/seller/sellerLogin/utils/sellerNavBar.dart';




class DataFeed extends StatefulWidget {
  const DataFeed({ Key key}) : super(key: key);

  @override
  DataState createState() => DataState();
}
  LatLng _center ;
  Position currentLocation;
class DataState extends State<DataFeed>{


//Controller
TextEditingController _id = new TextEditingController();
TextEditingController _name = new TextEditingController();
TextEditingController _dosage = new TextEditingController();
TextEditingController _availability = new TextEditingController();
TextEditingController _emailID = new TextEditingController();
TextEditingController _location = new TextEditingController();
TextEditingController _mobileno = new TextEditingController();



  @override
  Widget build(BuildContext context) {

 Future<Position> locateUser() async {
    return Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    //print('center $_center');
    return _center;
  }


  return Scaffold(
       drawer: sellerNavBar(),
        appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        title: Text("Home"),
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
//page UI
      body: Column(
    children: [
      Flexible(
        child: ListView(
            children: [
          Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),

     child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

//id
          TextField(
            controller: _id,
              decoration: InputDecoration(
                  hintText: "ID",
                  labelText: "ID:",
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
          SizedBox(
            height: 16,
          ),
//name
          TextField(
            controller: _name,
            decoration: InputDecoration(
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
          SizedBox(
            height: 16,
          ),
//dosage
          TextField(
            controller: _dosage,
            decoration: InputDecoration(
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
          SizedBox(
            height: 16,
          ),
//Location
          Text('center $_center'),
          TextField(
            controller: _location,
            decoration: InputDecoration(
                hintText: "Location",
                labelText: "Location:",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: UnderlineInputBorder()
            ),

            maxLines: 3,
          ),

//gap btw borders
          SizedBox(
            height: 16,
          ),
//availability
          TextField(
            controller: _availability,
            decoration: InputDecoration(
                hintText: "Availability",
                labelText: "Availability:",
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
          SizedBox(
            height: 16,
          ),


//mobile no
          TextField(
            controller: _mobileno,
            decoration: InputDecoration(
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
          SizedBox(
            height: 16,
          ),
//emailID
          TextField(
            controller: _emailID,
            decoration: InputDecoration(
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
            SizedBox(
              height: 16,
            ),

 

//Submit Button
          ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
          child: Text('Submit', style: TextStyle(color: Colors.white),),
              
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
  }}
 

