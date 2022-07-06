import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medbuddy/global/myDimens.dart';
import 'package:medbuddy/src/ui/consult/doctorsr.dart';
import 'package:medbuddy/src/ui/consult/patientvideocall/ptchannelInput.dart';
import 'package:medbuddy/src/ui/consult/rating/dcdeleterating.dart';
import 'package:medbuddy/src/ui/consult/rating/dcrateing.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';

class dcdetailview extends StatefulWidget {
  const dcdetailview({ Key key}) : super(key: key);

  @override
  DataState createState() => DataState();
}

class DataState extends State<dcdetailview>{
var collectionReference = FirebaseFirestore.instance.collection("consultDoctors");


  @override
  Widget build(BuildContext context) {

    return Scaffold(
         appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title:  const Text("Doctor details"),
        elevation: 16.0,
        actions: [
          new IconButton(
          icon: new Icon(Icons.video_call_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pvideocall()),
            );
          },
        ),

        ],
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
      body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection("consultDoctors").doc(consultdocid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        try{
         if (!snapshot.hasData) {

          return Center
          (child:Image.asset("assets/nothing.gif")
     );
        }

        else{
         double avg;
         int limit = snapshot.data['limit'];
         

          try{
           avg = (snapshot.data.get('reviewadd') / snapshot.data.get('reviewtotal'));
          }catch(e){
            avg=0.0;
          }          

          return 
          ListView(children: [

          Center(child:  Padding(padding: EdgeInsets.only(top: 20, bottom: 10),
          child: 
          Image.network(snapshot.data['images'],height: 300, width: 300, fit: BoxFit.fill,))),

          SizedBox(height: 10,),

//for avg rating          
                Row(children: [
                SizedBox(width: 10,),
                Container( 
                height: 40,
                color: Color.fromARGB(255, 5, 240, 130),
                child: Row(
                children:[
                SizedBox(width: 5,),
                Text(avg.toStringAsFixed(1), style: TextStyle(
                  color: Colors.white,fontFamily: 'JosefinSans', fontSize: 20,),),
                SizedBox(width: 5,),
                Icon(Icons.star,color: Colors.white,size: 20,),

                SizedBox(width: 5,),
                ])
                )
                ]),
                
 
//............................................................................................................          

          Column(children: [
          ListTile(
          leading: Text("Doctor name:" + " " + snapshot.data['doctor name'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20),)),

          SizedBox(height: 10,),

          ListTile(leading:
          Text("Reg no:" + " " + snapshot.data['regno'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),),

          SizedBox(height: 10,),

          ListTile(leading: 
          Text("Specialization:" + " " + snapshot.data['specialization'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20),)),

          SizedBox(height: 10,),

          ListTile(leading:
          Text("Mobile no:" + " " + snapshot.data['mobile no'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20),)),   

          SizedBox(height: 10,),
          
          
          Card(child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(width: 10,),
          Text("Consult time:" + "\n\n" + snapshot.data['consultTime'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),],)),
          
          SizedBox(height: 20,),

          ElevatedButton(
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple)
            ),              
            
            onPressed: () async{

            if(limit != 0){
                   await collectionReference.doc(consultdocid).update(
                        {
                        'token': FieldValue.increment(1),
                        },
                        );

                    await FirebaseFirestore.instance.collection("consultDoctors").doc(consultdocid).update({
                      'limit': FieldValue.increment(-1),
                    });

                    updatedata();

                      Fluttertoast.showToast(  
                      msg: 'Appoinment taken',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  );                    
              } else{
                      Fluttertoast.showToast(  
                      msg: 'Appoinment full',  
                      toastLength: Toast.LENGTH_LONG,  
                      gravity: ToastGravity.BOTTOM,  
                      //timeInSecForIosWeb: 1,  
                      backgroundColor: Colors.black,  
                      textColor: Colors.white  
                  ); 
              }
          }, 
          child: Text("Add an appointment")),


        SizedBox(height: 40,),

        Text("Patients Review:",
        style: TextStyle(color: Colors.black,fontFamily: 'JosefinSans', fontSize: 30,)
        ),

        Divider(
        indent: 5,
        endIndent: 5,
        color: Colors.black,
    ), 

        SizedBox(height: 30,),
    StreamBuilder(
      stream: FirebaseFirestore.instance.collection(consultdocid + "review")
          .orderBy("rating", descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if (!snapshot.hasData) {
          //hasdata = true;
          return Center
          (child: Text("No rating")
     );
        }
        
        else if (snapshot.data?.size == 0) {

          
            return Center
          (child: Text("No rating",
          style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans', fontSize: 20,))
          );
        }

        else{
                 return ListView.builder(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,

                  itemBuilder: (BuildContext context, int index) {
                  return Card(
                  child: Column(
                  children: [
                  SizedBox(height: 10,),
                    Row(children:[
                  SizedBox(width: 10,),
                  Container(
                  color: Colors.green,
                  child: Row(children: [
                  SizedBox(width: 5,),
                  Text(snapshot.data.docs[index]['rating'],
                  style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans', fontSize: 20,)),
                  SizedBox(width: 5,),
                  Icon(Icons.star,color: Colors.white,size: 15,),
                  SizedBox(width: 5,),
                     ],) ),]),

                  SizedBox(height: 10,),
                  Row(children:[
                  SizedBox(width: 10,),
                  Text("Name:" + " "),
                  Text(snapshot.data.docs[index]['name']),]),

                  SizedBox(height: 30,),
                  Row(children:[
                  SizedBox(width: 10,),
                  Text('Review:'),]),  
                  SizedBox(height: 10,),
                  Container(  alignment: Alignment.topLeft,              
                  child:  Padding(
                    padding: EdgeInsets.all(20), 
                    child:
                  Text(snapshot.data.docs[index]['review']),),)
                  ]),

          
            );
                  });}}),
                              SizedBox(height: 30),         
  //button for review
                                OutlineButton(
                                        onPressed: () async {
                                       
                             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => dcrateing()));
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MyDimens.double_4)),
                                        borderSide: BorderSide(
                                            color: Colors.deepPurpleAccent,
                                            width: MyDimens.double_1),
                                        color: Colors.deepPurpleAccent,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: MyDimens.double_15,
                                              bottom: MyDimens.double_15),
                                          child: 
                                           Text("Add your review",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                  color:
                                                  Colors.deepPurpleAccent,
                                                  //fontFamily:
                                                 // 'lexenddeca'
                                                 )),
                                        ),
                                      ),  
                                    SizedBox(height: 30,),
                                    InkWell(
                                  onTap: () async {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> dcratingdlt()));

                                  },
                            child: new Padding(
                              padding: const EdgeInsets.only(
                                top: 60.0,
                              ),
                              child: new Text(
                                "Delete rating",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: new TextStyle(
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0.5,
                                    color: Colors.grey,
                                    fontSize: 12.0),
                              ),
                            )),
                            SizedBox(height: 30,),


          ]),
          //),                           

        ],);

  }
  } catch(e){
          return Center
          (child: Image.asset("assets/nothing.gif")
     );
  }

     }),


 
    );
  }

  updatedata() async{
            int token;
           await collectionReference.doc(consultdocid).get().then((snapshot) {
           token = snapshot.get('token');
            });

                    await FirebaseFirestore.instance.collection("UserpublicID").doc(user.email).update({
                      'tokenno': token,
                    });

                    await FirebaseFirestore.instance.collection(consultdocid + "patients").doc(user.email).set({
                      'email': user.email,
                      //'name': ,
                      'token': token
                    });     

  }

}