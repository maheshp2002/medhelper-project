import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class contact extends StatelessWidget {
  contact();
  @override
  Widget build(BuildContext context) {
    return new InkWell(
          onTap: ()  {
         showModalBottomSheet<void>(context: context,
            builder: (BuildContext context) {
                return Container(
                    child: new Wrap(
                    children: <Widget>[
                        new ListTile(
                        leading: new Icon(Icons.mail, color: Colors.black,),
                        title: new Text('E-mail', style: TextStyle(fontFamily: 'JosefinSansBI')),
                        onTap: () async{
                        _sendingMails();         
                        }),
                        new ListTile(
                        leading: new Icon(Icons.web, color: Colors.black,),
                        title: new Text('Website', style: TextStyle(fontFamily: 'JosefinSansBI')),
                        onTap: () async{
                          launchURL();
                        })                        
                        ]
                        )
                        );}
                        );           

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
launchURL() async{

  var url = Uri.parse("https://maheshp7304.wixsite.com/maheshp");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
            Fluttertoast.showToast(  
            msg: 'Could not launch $url',  
            toastLength: Toast.LENGTH_LONG,  
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,  
            textColor: Colors.white  
            ); 
  }
}

_sendingMails()  {

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