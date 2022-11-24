import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/medseller_top_bar/sellerFulltop.dart';
import 'package:medbuddy/src/ui/search/values/colors_palette.dart';
import 'package:medbuddy/src/ui/search/values/constants.dart';
// import 'package:medbuddy/src/ui/search/tags/Bottle.dart';
// import 'package:medbuddy/src/ui/search/tags/Pill.dart';
// import 'package:medbuddy/src/ui/search/tags/Syringe.dart';
// import 'package:medbuddy/src/ui/search/tags/Tablet.dart';


var indexno;
String docid;
class Medsellertop extends StatelessWidget {
  const Medsellertop({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    return   StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Medicinesell").limit(5)
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
        
           return 
           
           ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,  
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

              indexno = snapshot.data.docs[index];
              docid = snapshot.data.docs[index].id;
              Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SellerFulltop()));},

            child: Column(
        children: [
          Flexible(child: 
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Image.network(snapshot.data.docs[index]['images'],
                        height: 300,
                        width: 200,
                        fit: BoxFit.fill,
                      ),
          )),
             Container(
              width: 200,
              height: 50,
             // padding: const EdgeInsets.all(kDefaultPadding / 2),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: 
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: snapshot.data.docs[index]['medicine name'].toUpperCase(),
                          style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
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
                  SizedBox(width: 10,),
                  Text("Price" + " " + 
                    snapshot.data.docs[index]['price'],
                    style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            
          )
        ],
        ),
      ),
    );


});       
  }
  }
  );
  //);
  }
}

// class topbar extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection("Medicinesell")
//           .orderBy("date", descending: true).snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//          if (!snapshot.hasData) {   
//           return Center
//           (child: 
//           Image.asset("assets/nothing.gif")
//      );
//         }

//       else if (snapshot.data?.size == 0) {
//         return Center
//           (child: Image.asset("assets/nothing.gif"));
//         }
//         else{
// //new streambuilder include image
//         return  ListView(
//           children: [
//  //.......................................................................................................
//  //top bar 
//       Padding(padding: EdgeInsets.only(top: 0, left: 10),  
//      child: Text("Categories:",textAlign: TextAlign.start,
//       style: TextStyle(color: Colors.black,fontFamily: 'JosefinSans', fontSize: 30,)),),
//       Divider(
//         indent: 20,
//         endIndent: 20,
//         color: Colors.black,
//     ),      

//       Padding(padding: EdgeInsets.all(10),            
//             child: Row( 
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//             TextButton(
//               style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
//               child: Row(children: [
//               Text("Pill",textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans')),
//               SizedBox(width: 5,),
//               Icon(Icons.bookmark,color: Colors.white),
//               ],),
//               onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=> pill()));
//               }
//               ),

//               SizedBox(width: 5,),

//              TextButton(
//               style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
//               child: Row(children: [
//               Text("Syringe",textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans')),
//               SizedBox(width: 5,),
//               Icon(Icons.bookmark,color: Colors.white),
//               ]),
//                 onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=> syringe()));
//               }            
//               ),  

//             SizedBox(width: 5,),

//             TextButton(
//               style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
//               child: Row(children: [
//               Text("Tablet",textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans')),
//               SizedBox(width: 5,),
//               Icon(Icons.bookmark,color: Colors.white),
//               ]),
//               onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=> tablet()));
//               }          
//               ),

//               SizedBox(width: 5,),    

//              TextButton(
//               style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
//               child: Row(children: [
//               Text("Bottle",textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans')),
//               SizedBox(width: 5,),
//               Icon(Icons.bookmark,color: Colors.white),
//               ]),
//                onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=> bottle()));
//               }             
//               )
                                
              
//               ]),),


//     //   Padding(padding: EdgeInsets.only(left: 10, top: 10),  
//     //  child: Text("Products",textAlign: TextAlign.start,
//     //   style: TextStyle(color: Colors.black,fontFamily: 'JosefinSans', fontSize: 30,)),),
//       Divider(
//         indent: 20,
//         endIndent: 20,
//         color: Colors.black,
//     )]);
//  //.......................................................................................................
//   }
 
//  });
 
//   }
//   }