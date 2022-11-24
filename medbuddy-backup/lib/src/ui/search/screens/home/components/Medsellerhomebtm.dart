import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/Animations.dart';
import 'package:medbuddy/src/ui/search/sellerFull.dart';
import 'package:medbuddy/src/ui/search/values/colors_palette.dart';
import 'package:medbuddy/src/ui/search/values/constants.dart';


  var indexnobtm;
  String docidbtm;
class Medsellerbottom extends StatefulWidget {
  String category;
  Medsellerbottom({Key key, this.category}) : super(key: key);

  @override
  _MedsellerbottomState createState() => _MedsellerbottomState();
}

class _MedsellerbottomState extends State<Medsellerbottom>{
  
  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    return  StreamBuilder(
      stream: widget.category == 'all'
      ? FirebaseFirestore.instance.collection("Medicinesell")
          .orderBy("medicine name", descending: false).snapshots()
      : FirebaseFirestore.instance.collection("Medicinesell")
          .where('ID', isEqualTo: widget.category).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if (!snapshot.hasData) {   
          return Center
          (child: 
          Image.asset("assets/nothing.gif")
     );
        }

      else if (snapshot.data?.size == 0) {
        return Center
          (child: Image.asset("assets/nothing.gif"));
        }
        else{
//new streambuilder include image
        
           return FadeAnimation(
           delay: .4,
           child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.3),
                  ),         
                  itemBuilder: (BuildContext context, int index) {
                    return  Container(

      margin: const EdgeInsets.only(
        top: kDefaultPadding / 2,
        left: kDefaultPadding,
        bottom: kDefaultPadding * 2.5,
      ),
      //width: size.width * 0.49,
      child:  GestureDetector(
            onTap: (){ 
              indexnobtm = snapshot.data.docs[index];
              docidbtm = snapshot.data.docs[index].id;
              Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SellerFull()));},
      child: Column(
        children: [
          Flexible(child: 
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Image.network(snapshot.data.docs[index]['images'],
                        height: 300,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
          )),

         Container(
              width: 300,
              height: 40,
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: ColorsPalette.kPrimaryColor.withOpacity(0.23),
                  )
                ],
              ),
              child: Row(
                children: [
                  Flexible(child: 
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: snapshot.data.docs[index]['medicine name'].toUpperCase(),
                          style: TextStyle(fontSize: 10, color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                    //     TextSpan(
                    //         text: snapshot.data.docs[index]['discount %'].toUpperCase(),
                    //         style: TextStyle(
                    //           color:
                    //               ColorsPalette.kPrimaryColor.withOpacity(0.5),
                    //         ))
                       ],
                     ),
                  )),
                  SizedBox(width: 8,),
                  Text("Price" + " " + 
                    snapshot.data.docs[index]['price'],
                    style: TextStyle(fontSize: 10, color: Colors.black,fontWeight: FontWeight.bold),
                  )
                ],
              ),
            
          )
        ],
      ),
    ));


}));       
  }
  }
  );

  }
}

