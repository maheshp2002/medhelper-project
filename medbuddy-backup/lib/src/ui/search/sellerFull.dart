import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/SellerMap.dart';


class SellerFull extends StatefulWidget {

@override
  _DetailedItemState createState() => _DetailedItemState();
}

class _DetailedItemState extends State<SellerFull> {

GeoPoint geoPoint = indexno['Latitude'];

/*  var _long, _lat;
  //List<Address> results = [];
  bool isLoading = false;
  String itemAddress;

@override
  initState() {
    super.initState();
   // _long = widget.Item.location.longitude;
    _lat = widget.Item.location.latitude;
    getAddressFromCoords(_lat, _long);
  }

Future getAddressFromCoords(_lat, _long) async {
    this.setState(() {
      this.isLoading = true;
    });

    try {
      var results = await Geocoder.local
          .findAddressesFromCoordinates(new Coordinates(_lat, _long));
      this.setState(() {
        this.results = results;
      });
    } catch (e) {
      print("Error occured: $e");
    } finally {
      this.setState(() {
        this.isLoading = false;
        itemAddress =
            "${results[0].thoroughfare}, ${results[0].locality}, ${results[0].countryName}";
      });}}

*/

//....................................................................................................
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(indexno['medicine name'])
),
  //backgroundColor: Colors.orange[300],
  body: Container(
    
    child: Column(children: [
    Card(
    child: ListTile(
    title:  Text("Dosage:" + " " + indexno['dosage']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),  
    Card(
    child: ListTile(              
    title:  Text("Availability:" + " " + indexno['availability']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("Address:" + " " + indexno['address']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
    Card(
    child: ListTile(                
    title:  Text("Mobile no:" + " " + indexno['mobile no']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ), 
    Card(
    child: ListTile(               
    title:  Text("Email-id:" + " " + indexno['email id']),
    )),
//gap btw borders

          const SizedBox(
            height: 16,
          ),      
      Text(geoPoint.toString()),
    ]),
      
    
  ),
);
}

}