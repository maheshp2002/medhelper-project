import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/body.dart';
// import 'package:medbuddy/src/ui/tabpage/tabs.dart';


class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       appBar: AppBar(
//       title: Text("MedSeller"),
//       backgroundColor: Colors.deepPurple,
//               leading: new IconButton(
//           icon: new Icon(Icons.arrow_back),
//           onPressed: () {
//            // checkbool1();
//             Navigator.pop(context);
//           },
//         ),
// ),

//new..........................................................................
      // appBar: AppBar(
      // backgroundColor: ColorsPalette.kPrimaryColor,
      // elevation: 0,
      // ),

      body: Body(),
    //])
    );
  }

}
//........................................................................................




  // AnimationController _ColorAnimationController;
  // AnimationController _TextAnimationController;
  // Animation _colorTween, _iconColorTween;
  // Animation<Offset> _transTween;

  // @override
  // void initState() {
  //   _ColorAnimationController =
  //       AnimationController(vsync: this, duration: Duration(seconds: 0));
  //   _colorTween = ColorTween(begin: Colors.transparent, end: Color(0xFFee4c4f))
  //       .animate(_ColorAnimationController);
  //   _iconColorTween = ColorTween(begin: Colors.grey, end: Colors.white)
  //       .animate(_ColorAnimationController);


  //   _TextAnimationController =
  //       AnimationController(vsync: this, duration: Duration(seconds: 0));

  //   _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
  //       .animate(_TextAnimationController);

  //   super.initState();
  // }

  // bool _scrollListener(ScrollNotification scrollInfo) {
  //   if (scrollInfo.metrics.axis == Axis.vertical) {
  //     _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 350);

  //     _TextAnimationController.animateTo(
  //         (scrollInfo.metrics.pixels - 350) / 50);
  //     return true;
  //   }
  // }

// NotificationListener<ScrollNotification>(
//       onNotification: _scrollListener, 
          // Container(
          // height: 80,
          // child: AnimatedBuilder(
          // animation: _ColorAnimationController,
          // builder: (context, child) => AppBar(
          // backgroundColor: _colorTween.value,
          // elevation: 0,
          // titleSpacing: 0.0,
          // title: Transform.translate(
          // offset: _transTween.value,
          // child: Text("اسم کالا اینجا",
          // style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          // ),
          // ),
          // ))
          // ),