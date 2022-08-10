import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/about/dbfull.dart';
import 'package:medbuddy/src/ui/tabpage/tabs.dart';



class UserInformation extends StatefulWidget {
  @override
    _UserInformationState createState() => _UserInformationState();
}


class _UserInformationState extends State<UserInformation> {

@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: AddData(),
	);
}
}

var DTindexno;

class AddData extends StatelessWidget {
  //CollectionReference  
  //final collectionReference = FirebaseFirestore.instance.collection(user.uid).snapshots();


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
          "Data Retrival",
          style: TextStyle(fontFamily: 'JosefinSansBI',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body:   StreamBuilder(
      stream: FirebaseFirestore.instance.collection(user.uid).limit(12)
          .orderBy("medicine_name", descending: true).snapshots(),
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
             ListView.builder(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,

                  itemBuilder: (BuildContext context, int index) {
                  return Card(
                  child: ListTile(
                    
                  title: Text(snapshot.data.docs[index]['medicine_name'],
                  style: TextStyle(fontSize: 20, fontFamily: 'JosefinSansBI')),
                  subtitle: Text(snapshot.data.docs[index]['time'],
                  style: TextStyle(fontSize: 15, fontFamily: 'JosefinSans')),
                  trailing: Icon(Icons.arrow_forward_ios),
                   onTap: (){
                      DTindexno = snapshot.data.docs[index];
                      Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => dbfull())
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
                  ],

        );
      }
      }));
        }
        }

  