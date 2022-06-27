import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/rateing/rateingsplash.dart';
import 'package:medbuddy/src/ui/search/tags/Viewmorebtm.dart';




class rateingvbt extends StatefulWidget {

  @override
  _rateingState createState() => _rateingState();
}

class _rateingState extends State<rateingvbt> {
  double rating1;
  String star;
  String emailid;
  String review;

  TextEditingController reviewController = TextEditingController();
  final collectionReference = FirebaseFirestore.instance;
  final users = FirebaseFirestore.instance.collection("username").doc(user.uid);


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Rating"),
        elevation: 16.0,
),

        body:  Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Flexible(
              child:TextField(
              decoration: InputDecoration(
              hintText: "Enter review here",
              labelText: "Review:",
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
                border: OutlineInputBorder()
            ),
               onChanged: ((value) {
                  review = value;
                }),
            controller: reviewController,
            keyboardType: TextInputType.multiline,
            maxLines: 30,
          ),),

          SizedBox(
            height: 16,
          ),
          RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating)=> setState((){
                this.rating1 = rating;
              }) ,
            ),

          SizedBox(
            height: 16,
          ),

          Flexible(child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                  width: 220,
                  height: 70,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    shape: StadiumBorder(),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    onPressed: () async{
                        
                        String uname;
                        await users.get().then((snapshot) {
                              uname = snapshot.get('username');
                            });
                        await collectionReference.collection(docidviewmore + "review").add(
                        {
                        'review':review,
                        'rateing':rating1.toString(),
                        'name':uname,
                        'email': user.email
                        }, 
                        );
                        //add rating for avg
                        await collectionReference.collection('average rating').doc(docidviewmore).set(
                          {
                          'avg': FieldValue.increment(rating1),
                          'length': FieldValue.increment(1)
                          },
                          SetOptions(merge: true)
                         
                          );
                      Fluttertoast.showToast(  
                      msg: 'Review added',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 
                  


                        
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> rateingSucess()));
                        reviewController.clear();
                        }
                        
                        )
                        )),),
          ],
        )));
  }

}
