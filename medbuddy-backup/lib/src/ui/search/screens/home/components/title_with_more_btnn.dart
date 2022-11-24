import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/tags/Viewmorebtm.dart';
import 'package:medbuddy/src/ui/search/values/colors_palette.dart';
import 'package:medbuddy/src/ui/search/values/constants.dart';


class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);

  final String title;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          CustomTitleWithUnderline(
            text: title,
          ),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: ColorsPalette.kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                primary: Color.fromARGB(255, 11, 24, 19)),
            child: Text(title == 'Products' ? "View All"
              : "View More",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => viewmorebtm()));},
          )
        ],
      ),
    );
  }
}

class CustomTitleWithUnderline extends StatelessWidget {
  const CustomTitleWithUnderline({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorsPalette.kPrimaryColor),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: ColorsPalette.kPrimaryColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
