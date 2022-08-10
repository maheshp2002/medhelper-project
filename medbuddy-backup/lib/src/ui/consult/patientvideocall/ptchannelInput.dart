import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/src/ui/consult/doctorsr.dart';
//import 'package:medbuddy/src/ui/consult/patientvideocall/patientvideocall.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';


String Pchannelid;

class Pvideocall extends StatefulWidget {
  Pvideocall({Key key}) : super(key: key);

  @override
  _doctorHomePageState createState() => _doctorHomePageState();
}


class _doctorHomePageState extends State<Pvideocall> {

  int tokencheck;
  int mytoken;
  String channel;

var collectionReference = FirebaseFirestore.instance.collection("consultDoctors");

   TextEditingController channelController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Consult"),
        elevation: 16.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white, 
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            
            );
          },
        ),),

        body:  
                        StreamBuilder(
                            stream: FirebaseFirestore.instance.collection("consultDoctors").doc(consultdocid).snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return Center
                                (child:Image.asset("assets/nothing.gif")
                          );
                              }                            

                              else{      
                                  String Pvccode = snapshot.data['vccode'];
        return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

          SizedBox(
            height: 16,
          ),

// TextField(
//               decoration: InputDecoration(
//               hintText: "channel name",
//               labelText: "Channel name:",
//               labelStyle: TextStyle(
//                 fontSize: 15,
//                 color: Colors.black
//               ),
//                 border: OutlineInputBorder()
//             ),
//                onChanged: ((value) {
//                   channel = value;
//                 }),
//             controller: channelController,
//             keyboardType: TextInputType.multiline,
//           ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),
            child: ListTile(
              leading: Icon(Icons.link, color: Colors.grey,),
              title: SelectableText(
                Pvccode,
                style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
              ),
              trailing: Icon(Icons.copy),
              onTap: (){
                Clipboard.setData(ClipboardData(text: Pvccode));
                     Fluttertoast.showToast(  
                      msg: 'copied',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );  
              }
            )
          ),
 
          SizedBox(
            height: 16,
          ),
          
          // tokencheck == mytoken ? Navigator.push(context, MaterialPageRoute(builder: (context)=> patientvideocall())) : 
          // Flexible(child: Padding(
          //   padding: EdgeInsets.all(20),
          //   child: Container(
          //         width: 220,
          //         height: 70,
          //         child: FlatButton(
          //           color: Colors.deepPurple,
          //           shape: StadiumBorder(),
          //           child: Center(
          //             child: Text(
          //               "Enter",
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 28,
          //                 fontWeight: FontWeight.w700,
          //               ),
          //             ),
          //           ),
          //           onPressed: () async{

          //             Pchannelid = Pvccode;
                        
          //             Navigator.push(context, MaterialPageRoute(builder: (context)=> patientvideocall()));
          //               channelController.clear();
          //               }
                        
          //               )
          //               )),),

                  Row(mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    
                      StreamBuilder(
                            stream: FirebaseFirestore.instance.collection("consultDoctors").doc(consultdocid).snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return Center
                                (child:Image.asset("assets/nothing.gif")
                          );
                              }                            

                              else{
                                try{
                                  tokencheck = snapshot.data['nextpt'];
                                  //vccode = snapshot.data['vccode'];
                                  if(mytoken == snapshot.data['nextpt']){
                                    Pchannelid = Pvccode;
                                    //Future.delayed(Duration.zero, () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> patientvideocall()));});
                                  }
                                   Future.delayed(Duration(seconds: 3), () {
                                   if(mytoken == snapshot.data['nextpt']){
                                    Pchannelid = Pvccode;
                                    //Future.delayed(Duration.zero, () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> patientvideocall()));});
                                  }                                   

                                   });
                                

                                return Column(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Text("Next token no:"),

                                  SizedBox(width: 5,),

                                  ElevatedButton(
                                    style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 224, 224, 224))
                                    ),                                      
                                    child: Text(snapshot.data['nextpt'].toString(), style: TextStyle(color: Colors.black),),),
        ],),
        ],);

                  }catch(e) {
                      return Text("No appointment", style: TextStyle(color: Colors.grey));
                    }
                              }}),
                   
                      SizedBox(width: 10,),

                       StreamBuilder(
                            stream: FirebaseFirestore.instance.collection(consultdocid + "patients").doc(user.email).snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                return Center
                                (child:Image.asset("assets/nothing.gif")
                          );
                              }

                              else{
                                try {
                                  mytoken = snapshot.data['token'];
                                return Column(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Text("Your token no:"),

                                  SizedBox(width: 5,),

                                  ElevatedButton(
                                    style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 224, 224, 224))
                                    ),                                      
                                    child: Text(snapshot.data['token'].toString(), style: TextStyle(color: Colors.black),),),
        ],),
        ],);
                          }catch(e) {
                      return SizedBox(height:20);
                    }                             
         }}),
                  
                  
                  ]),



          ],
        ));
         }}),
        );
  }
}
