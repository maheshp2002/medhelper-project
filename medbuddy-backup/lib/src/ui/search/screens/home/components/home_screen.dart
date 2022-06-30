import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/body.dart';
import 'package:medbuddy/src/ui/tabpage/tabs.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("MedSeller"),
      backgroundColor: Colors.deepPurple,
              leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
           // checkbool1();
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => tab()),
            );
          },
        ),
),
      body:  Body(),
      //bottomNavigationBar: const MyBottomNavBar(),
    );
  }

  // AppBar buildAppBar() {
  //   return AppBar(
  //     elevation: 0,
  //     leading: IconButton(
  //       icon: Icon(Icons.home),
  //       //SvgPicture.asset("assets/icons/menu.svg"),
  //       onPressed: () {},
  //     ),
  //   );
  // }
}
