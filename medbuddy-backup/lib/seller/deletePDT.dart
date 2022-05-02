import 'package:flutter/material.dart';
import 'package:medbuddy/global/myColors.dart';
import 'package:medbuddy/global/myDimens.dart';
import 'package:url_launcher/url_launcher.dart';


class DeletePdt extends StatefulWidget {
  @override
  DeleteState createState() => DeleteState();

  
}

class DeleteState extends State<DeletePdt>{
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.orange,
        //Color(0xFF3EB16F),
        title: Text(
          "Delete Product",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
  backgroundColor: Colors.white,

  body: Container(
    alignment: Alignment.center,

    
    child: 
    Container(
      alignment: Alignment.center,
      child: Column(children: [
           const SizedBox(
             height: 140,
           ), 

        Image.asset("assets/splash/mail_us.png", width: 200,height: 200,),
        Flexible(child:         
        Text("Want to delete a product?",style: TextStyle(fontFamily: 'JosefinSans',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        ),),),
          const SizedBox(
            height: 30,
          ),
         Flexible(child:          
        Text("Just send a mail along with following details:",style: TextStyle(fontFamily: 'JosefinSans',fontSize: 15),), 
         ),
          const SizedBox(
            height: 20,
          ), 
         Flexible(child:                  
        Text("- Medicine name\n\n- E-mail ID\n\n- Phone number",style: TextStyle(fontFamily: 'JosefinSans',fontSize: 15),),      
           ),
           const SizedBox(
            height: 20,
          ), 
                   Flexible(child: 
                                     OutlineButton(
                                        onPressed: () async {
                                           _sendingMails();  
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MyDimens.double_4)),
                                        borderSide: BorderSide(
                                            color: MyColors.lighterPink,
                                            width: MyDimens.double_1),
                                        color: MyColors.primaryColor,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: MyDimens.double_15,
                                              bottom: MyDimens.double_15),
                                          child: Text("Send email",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                  color:
                                                  MyColors.lighterPink,
                                                  //fontFamily:
                                                 // 'lexenddeca'
                                                 )),
                                        ),
                                      ),),       
      ],),

    ),
));
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
    'subject': 'Delete product'
  }),
);

launchUrl(emailLaunchUri);
}

  }