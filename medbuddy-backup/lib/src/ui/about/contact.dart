import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class contact extends StatelessWidget {
  contact();
  @override
  Widget build(BuildContext context) {
    return new InkWell(
          onTap: () async {
            _sendingMails();

          },
     child: new Padding(
      padding: const EdgeInsets.only(
        top: 60.0,
      ),
      child: new Text(
        "Contact us",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: Colors.grey,
            fontSize: 12.0),
      ),
    ));
  }
_sendingMails()  {
//   const url = 'mailto:maheshp7304@gmail.com';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
String encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'maheshp7304@gmail.com',
  query: encodeQueryParameters(<String, String>{
    'subject': 'Bug report/help'
  }),
);

launchUrl(emailLaunchUri);
}
}