import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/prescription/Prescription.dart';
import 'package:medbuddy/src/ui/search/Animations.dart';
import 'package:medbuddy/src/ui/tabpage/tabs.dart';



class prescTile extends StatefulWidget {
  @override
  _prescTilepageState createState() => _prescTilepageState();
}
    var preindexno;
    bool hasdata;

class _prescTilepageState extends State<prescTile>{
    //final collectionReference = FirebaseFirestore.instance.collection(user.email).snapshots();
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
                leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tab()),
            );
          },
        ),

        title: Text(
          "Prescription",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
  //backgroundColor: Colors.grey[200],
	body:  
  StreamBuilder(
      stream: FirebaseFirestore.instance.collection(user.email).limit(12)
          .orderBy("date", descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if (!snapshot.hasData) {
          //hasdata = true;
          return Center
          (child: Image.asset("assets/nothing.gif")
     );
        }
        
        else if (snapshot.data?.size == 0) {

          
            return Center
          (child: Image.asset("assets/nothing.gif"));
        }

        else{
          return ListView(
          children: [
            FadeAnimation(
            delay: 0.8,
            child:
            ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,

                  itemBuilder: (BuildContext context, int index) {
                  return Card(
                  child: ListTile(
                    
                  title: Text(snapshot.data.docs[index]['date']),
                  subtitle: Text(snapshot.data.docs[index]['doctor name']),
                  trailing: Icon(Icons.arrow_forward_ios),
                   onTap: (){
                      preindexno = snapshot.data.docs[index];
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => Prescription())
                      );
                    },
                    onLongPress: () {
                      
        showModalBottomSheet<void>(context: context,
            builder: (BuildContext context) {
                return Container(
                    child: new Wrap(
                    children: <Widget>[
                        new ListTile(
                        leading: new Icon(Icons.delete),
                        title: new Text('Delete'),
                        onTap: () async{
                        await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
                        await myTransaction.delete(snapshot.data.docs[index].reference);}
                        );
                        })
                        ]
                        )
                        );}
                        );
                    }
                  ),
          
            );
                  })
          )],

        );
      }
      }));
        }
        }

