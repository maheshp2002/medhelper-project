import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/values/colors_palette.dart';
import 'package:medbuddy/src/ui/search/values/constants.dart';


class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 60,
      decoration:
          BoxDecoration(color: Color.fromARGB(255, 233, 229, 229), boxShadow: [
        BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: ColorsPalette.kPrimaryColor.withOpacity(0.38)),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/home.png"),
          ),
          IconButton(
              onPressed: () {}, icon: Image.asset("assets/icons/menu.png")),
          IconButton(
              onPressed: () {}, icon: Image.asset("assets/icons/heart.png")),
          IconButton(
              onPressed: () {}, icon: Image.asset("assets/icons/user.png")),
        ],
      ),
    );
  }
}
