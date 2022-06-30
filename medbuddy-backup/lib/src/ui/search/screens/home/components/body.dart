import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/header_with_search.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/Medsellerhometop.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/Medsellerhomebtm.dart';
import 'package:carousel_slider/carousel_slider.dart';


import 'title_with_more_btnn.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<Body> {
  int _current = 0;

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
          HeaderWithSearchBox(size: size),  
                                               
          SizedBox(
            height: 200,
          child: topbar(),),
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
      ]),),  

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
          RecomendsClothesMale()
        ],
      ),
    ));
  }
}