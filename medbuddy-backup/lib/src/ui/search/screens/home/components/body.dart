import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/header_with_search.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/Medsellerhometop.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/Medsellerhomebtm.dart';


import 'title_with_more_btnn.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

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