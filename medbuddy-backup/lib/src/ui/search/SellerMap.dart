import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/sellerFull.dart';


class sellerMap extends StatefulWidget {
  @override
  _sellerMapageState createState() => _sellerMapageState();
}
    var indexno;

class _sellerMapageState extends State<sellerMap>{
    final collectionReference = FirebaseFirestore.instance.collection("Medicinesell").snapshots();
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Color(0xFF3EB16F),

        title: Text(
          "Seller Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body:  StreamBuilder(stream: collectionReference,
   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
     if(snapshot.hasData){
       return ListView.separated(
         itemBuilder:(BuildContext context, int index) {
           return Column(
              children: snapshot.data.docs.map((doc) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data.docs[index]['medicine name']),
                    onTap: (){
                      indexno = snapshot.data.docs[index];
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => SellerFull())
                      );
                    },
                  ),
                );
              }).toList(),);
              
              },
               separatorBuilder: (context, index) {
           return Divider();
          },
              itemCount: snapshot.data.docs.length,
       );
     }
     return Center(child: CircularProgressIndicator(),
     );
     },),

  );
	
  
}
}
  /*StreamBuilder(
      stream: collectionReference,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
              return Center(child: const Text('Loading data...'));
          }
        return
        Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                    Colors.lightGreen[800],
                    Colors.black,
                  ], radius: 0.85, focal: Alignment.center),
                ),
                child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Text(snapshot.data.docs[index]['medicine name'],style: TextStyle(fontSize: 10));
          },
          itemCount: snapshot.data.docs.length,
        ));
      },
    ));
  }
}*/
//.................................................................................................

/*  String uid = FirebaseAuth.instance.currentUser.uid;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  getMarkerData() {
    users
        .doc(uid)
        .collection("Medicinesell")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        initMarker(doc.data(), doc.id);
      });
    });
  }
  

  void initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(specify['location'].latitude, specify['location'].longitude),
      infoWindow: InfoWindow(title: specify['name']),
    );
    setState(() {
      markers[markerId] = marker;
      //print(markerId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: Set<Marker>.of(markers.values),
        //markers: getMarkerData(), the markers didn't show up if i use this, so i use the above instead
        mapType: MapType.normal,
        zoomControlsEnabled: true,
        initialCameraPosition: initialLocation,
        onMapCreated: (GoogleMapController controller) {
          controller = controller;
        },
      ),
    );

  
}*/

class rest_model{
String medicine_name;
String address;
String mobileno;
String emailid;
var med_list = new List<Map>();

rest_model.fromMap(Map<String, dynamic> map) {
  this.medicine_name = map['medicine name'];
  this.address = map['address'];
  this.mobileno = map['mobile no'];
  this.emailid = map['email id'];
  this.med_list = map['Medicinesell'].map((Map<String, dynamic> med) {
    Map<String, dynamic> medc = {
      'medicine name': med['medicine name'],
      'address': med['address'],
      'mobile no': med['mobile no'],
      'email id': med['email id'],
    };
    return medc;
  }).toList();
}}