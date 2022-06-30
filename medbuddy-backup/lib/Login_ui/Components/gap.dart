import 'package:flutter/material.dart';




class gap extends StatelessWidget {
  gap();
  @override
  Widget build(BuildContext context) {
    return new InkWell(
 
     child: new Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: new Row(children: [
        SizedBox(
          width: 10,
        ),
        new Text(
        "|",
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            color: Colors.grey,
            fontSize: 15),
      ),
          SizedBox(
          width: 10,
        ),
      ],

      )
    ));
  }
}
