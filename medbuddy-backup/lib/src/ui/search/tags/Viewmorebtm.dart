import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/tags/viewmore/sellerFullvb.dart';
import 'package:medbuddy/src/ui/search/values/colors_palette.dart';
import 'package:medbuddy/src/ui/search/values/constants.dart';





class viewmorebtm extends StatefulWidget {
  @override
  _sellerMapageState createState() => _sellerMapageState();
}
var indexnoviremore;
String docidviewmore;

class _sellerMapageState extends State<viewmorebtm>{
     List<String> images = [
'assets/ads/Picsart_22-06-27_15-16-10-382.png',
'assets/ads/Picsart_22-06-27_17-30-44-638.png',
'assets/ads/Picsart_22-06-27_17-33-52-733.png'

 ];
    //final collectionReference = FirebaseFirestore.instance.collection("Medicinesell").snapshots();
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        //  leading: new IconButton(
        //    icon: new Icon(Icons.arrow_back),
        //    onPressed: () {
        //      Navigator.push(
        //        context,
        //        MaterialPageRoute(builder: (context) => sellerMap()),
        //     );
        //   },
        // ),
        title: Text(
          "Med-Seller",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body: 
   StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Medicinesell")
          .orderBy("date", descending: true).snapshots(),
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
        
           return ListView(
           children: [
   SizedBox(
      height: 300,
   child:  CarouselSlider(
          options: CarouselOptions(
            scrollPhysics: const ScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            height: 200,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            autoPlay: true,
          ),
          items: images
          .map(
            (e) => Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 221, 218, 233).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 30.0,
                    offset: -Offset(0, 3),
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(e),
                ),
              ),
            ),
          )
          .toList(),
    )

    ),         
            
            
            
            GridView.builder(
                  physics: ScrollPhysics(),
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
              indexnoviremore= snapshot.data.docs[index];
              docidviewmore = snapshot.data.docs[index].id;
              Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SellerFullvb()));},
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


})]);       
  }
  }
  ));
  //);
  }
}

