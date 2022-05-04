import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/rateing/rateingsplash.dart';
import 'package:medbuddy/src/ui/search/tags/Pill.dart';



class rateingP extends StatefulWidget {

  @override
  _rateingState createState() => _rateingState();
}

class _rateingState extends State<rateingP> {
  double rating1;
  String star;
  String emailid;
  String review;

   TextEditingController reviewController = TextEditingController();
  final collectionReference = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Rateing"),
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
                      Fluttertoast.showToast(  
                      msg: 'Review added',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 
                  
                      await collectionReference.collection(Pdocid + "review").add(
                        {
                        'review':review,
                        'rateing':rating1.toString(),
                        'email':user.email
                        }, 
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
