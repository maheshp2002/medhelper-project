import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/seller/orders/Updatestatus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ordermap extends StatefulWidget {
  @override
  _sellerMapageState createState() => _sellerMapageState();
}

var orderindexno;
String orderdocid;

class _sellerMapageState extends State<ordermap> {
  String images;
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            "Product orders",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          elevation: 0.0,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("ProductSeller")
                .where('Did', isEqualTo: user.email)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Image.asset("assets/nothing.gif"));
              } else if (snapshot.data?.size == 0) {
                return Center(child: Image.asset("assets/nothing.gif"));
              } else {
//new streambuilder include image
                return ListView(children: [
                  ListView.builder(
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          onLongPress: () {
                            showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                      child: new Wrap(children: <Widget>[
                                    new ListTile(
                                        leading: new Icon(Icons.delete),
                                        title: new Text('Remove'),
                                        onTap: () async {
                                          await FirebaseFirestore.instance
                                              .runTransaction((Transaction
                                                  myTransaction) async {
                                            await myTransaction.delete(snapshot
                                                .data.docs[index].reference);
                                            Fluttertoast.showToast(
                                                msg: 'Item removed from orders',
                                                toastLength: Toast.LENGTH_LONG,
                                                gravity: ToastGravity.BOTTOM,
                                                //timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.black,
                                                textColor: Colors.white);
                                          });
                                        })
                                  ]));
                                });
                          },
                          onTap: () {
                            orderdocid = snapshot.data.docs[index].id;
                            orderindexno = snapshot.data.docs[index];
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Updatestatus()));
                          },
                          leading: Image.network(
                              snapshot.data.docs[index]['images']),
                          title: Text("Medicine name:" +
                              " " +
                              snapshot.data.docs[index]['medicine name'] +
                              "\nPrice:" +
                              " " +
                              snapshot.data.docs[index]['price'] +
                              "\ndosage:" +
                              " " +
                              snapshot.data.docs[index]['dosage']),
                          subtitle: Text("Coustomer name:" +
                              " " +
                              snapshot.data.docs[index]['name']),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ]);
              }
            }));
  }
}

Future<void> deleteFile(String url) async {
  try {
    await FirebaseStorage.instance.refFromURL(url).delete();
  } catch (e) {
    print("Error deleting db from cloud: $e");
  }
}
