import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/Animations.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/header_with_search.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/Medsellerhometop.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/Medsellerhomebtm.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:medbuddy/src/ui/search/values/colors_palette.dart';


import 'title_with_more_btnn.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<Body> with TickerProviderStateMixin {

int _current = 0;
String category = 'all';

List<String> images = [
'assets/ads/Picsart_22-06-27_15-16-10-382.png',
'assets/ads/Picsart_22-06-27_17-30-44-638.png',
'assets/ads/Picsart_22-06-27_17-33-52-733.png'

 ];
//CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
    child: SingleChildScrollView(
    child: Column(
    children: [
    Container(
    height: 30,
    child: AppBar(
    backgroundColor: ColorsPalette.kPrimaryColor,
    elevation: 0,
    )),

    FadeAnimation(
    delay: 0.6,
    child: HeaderWithSearchBox(size: size),      
    ),

    SizedBox(
    height: 200,
    // child: topbar(),
      child: StreamBuilder(
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
        return  ListView(
          children: [
 //.......................................................................................................
 //top bar 
      Padding(padding: EdgeInsets.only(top: 0, left: 10),  
     child: Text("Categories:",textAlign: TextAlign.start,
      style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans', fontSize: 30,)),),
      Divider(
        indent: 20,
        endIndent: 20,
        color: Colors.grey[200],
    ),      
      FadeAnimation(
      delay: 0.8,
      child: Padding(padding: EdgeInsets.all(10),            
            child: Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(category == 'pill' ? Colors.white : Colors.orange)),
              child: Row(children: [
              Text("Pill", textAlign: TextAlign.center,
              style: TextStyle(color: category == 'pill' ? Colors.grey : Colors.white,fontFamily: 'JosefinSans')),
              SizedBox(width: 5,),
              Icon(Icons.bookmark,color: category == 'pill' ? Colors.grey: Colors.white),
              ],),
              onPressed: (){
                if (category == 'pill') {
                  setState(() {
                    category = 'all';
                  });
                } else {
                  setState(() {
                    category = 'pill';
                  });
                }
              }
              ),

              SizedBox(width: 5,),

             TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(category == 'syringe' ? Colors.white : Colors.orange)),
              child: Row(children: [
              Text("Syringe",textAlign: TextAlign.center,
              style: TextStyle(color: category == 'syringe' ? Colors.grey : Colors.white,fontFamily: 'JosefinSans')),
              SizedBox(width: 5,),
              Icon(Icons.bookmark,color: category == 'syringe' ? Colors.grey: Colors.white),
              ]),
                onPressed: (){
                 if (category == 'syringe') {
                  setState(() {
                    category = 'all';
                  });
                } else {
                  setState(() {
                    category = 'syringe';
                  });
                }
              }            
              ),  

            SizedBox(width: 5,),

            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(category == 'tablet' ? Colors.white : Colors.orange)),
              child: Row(children: [
              Text("Tablet",textAlign: TextAlign.center,
              style: TextStyle(color: category == 'tablet' ? Colors.grey : Colors.white,fontFamily: 'JosefinSans')),
              SizedBox(width: 5,),
              Icon(Icons.bookmark,color: category == 'tablet' ? Colors.grey: Colors.white),
              ]),
              onPressed: (){
               if (category == 'tablet') {
                  setState(() {
                    category = 'all';
                  });
                } else {
                  setState(() {
                    category = 'tablet';
                  });
                }
              }          
              ),

              SizedBox(width: 5,),    

             TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(category == 'bottle' ? Colors.white : Colors.orange)),
              child: Row(children: [
              Text("Bottle",textAlign: TextAlign.center,
              style: TextStyle(color: category == 'bottle' ? Colors.grey : Colors.white,fontFamily: 'JosefinSans')),
              SizedBox(width: 5,),
              Icon(Icons.bookmark,color: category == 'bottle' ? Colors.grey: Colors.white),
              ]),
               onPressed: (){
                if (category == 'bottle') {
                  setState(() {
                    category = 'all';
                  });
                } else {
                  setState(() {
                    category = 'bottle';
                  });
                }
              }             
              )
                                
              
              ]),)),


    //   Padding(padding: EdgeInsets.only(left: 10, top: 10),  
    //  child: Text("Products",textAlign: TextAlign.start,
    //   style: TextStyle(color: Colors.black,fontFamily: 'JosefinSans', fontSize: 30,)),),
      Divider(
        indent: 20,
        endIndent: 20,
        color: Colors.grey[200],
    )]);
 //.......................................................................................................
  }
 
 })),

  FadeAnimation(
  delay: 0.6,
  child: 
  SizedBox(
  height: 300,
  width: 500,
  child:  Column(children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
           onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
              },
            //aspectRatio: 10/4,
            scrollPhysics: const ScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            height: 200,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
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
    ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            return GestureDetector(
              //onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),)),  

          TitleWithMoreBtn(
            title: "New ones",
            press: () {},
          ),
          SizedBox(
            height: 300,
          child: 
          Medsellertop(),
          ),
          TitleWithMoreBtn(
            title: "Products",
            press: () {},
          ),
          Medsellerbottom(category: category,)
        ],
      ),
    ));
  }
}