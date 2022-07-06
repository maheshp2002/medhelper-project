import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/doctor/doctorconsult/channelInput.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


PanelController _pc2 = new PanelController();


String nvdocid;
class vcNavBar extends StatelessWidget {
User user = FirebaseAuth.instance.currentUser;

//   @override
//   _vcNavBar createState() => _vcNavBar();
// }

// class _vcNavBar extends State<vcNavBar> {
// var gettkn = FirebaseFirestore.instance.collection(user.email + "patients")
//   @override
//   void initState() {
//     gettokenno();
//     //initAgora();
//     super.initState();
//   }
//    gettokenno() async{

// int currentToken;
//            await gettkn.get().then((snapshot) {
//            currentToken = snapshot.get('stockno');
//         });
//   }

  @override
  Widget build(BuildContext context) {


    return
   StreamBuilder(
          stream: FirebaseFirestore.instance.collection(user.email + "patients")
         .where('token', isEqualTo: nexttoken)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if (!snapshot.hasData) {   
        return Drawer(
       child: Center
          (child: Image.asset("assets/nothing.gif")));
        }

        else{

     return Drawer(
      child: SlidingUpPanel(
        slideDirection: SlideDirection.DOWN,
          controller: _pc2,
      boxShadow: const <BoxShadow>[BoxShadow(blurRadius: 8.0, color: Color.fromARGB(62, 20, 20, 20))],
       borderRadius: BorderRadius.only(
       topLeft: Radius.circular(18.0),
       topRight: Radius.circular(18.0)),
       // header: Icon(Icons.more_horiz_outlined,color: Colors.black,),
        minHeight: 0,
        maxHeight: 800,
        color: Color.fromARGB(255, 250, 248, 248),
      panel: slidedownbar(),
      body: 
 ListView(
           children: [
          
            ListView.builder(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,       
                  itemBuilder: (BuildContext context, int index) {
                    return  Card(child:     
      ListTile(
        title: Text(snapshot.data.docs[index]['email']),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          nvdocid = snapshot.data.docs[index]['email'];
          _pc2.open();
          },

      )
                    );
                  })
           ],
      )

     )
     );

        }});
  }
}

class slidedownbar extends  StatelessWidget {   
      User user = FirebaseAuth.instance.currentUser;

   @override
  Widget build(BuildContext context) {     
     return       StreamBuilder(
      stream: FirebaseFirestore.instance.collection("UserpublicID")
          .doc(nvdocid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if (!snapshot.hasData) {   
             return Center
          (child: Image.asset("assets/nothing.gif"));
        }

        else{
     return ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: Color(0xFF3EB16F),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(snapshot.data['images']))),
          ),

          ListTile(
           title: Text("Email ID:" + " " + 
                    snapshot.data['Did'],
                    style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                  ),
          subtitle: Text("Name:" + " " + 
                    snapshot.data['User name'],
                    style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                  ),

          ),
          ListTile(
        leading:
                  Text("Age:" + " " + snapshot.data['age'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),

          ),  
          Card(child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(width: 10,),
            Text("Health issues:" + "\n\n" + snapshot.data['issue'], textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
          SizedBox(width: 10,),
          ],)),   
          
          SizedBox(width: 10,),

          IconButton(onPressed: ()=> _pc2.close(), icon: Icon(Icons.arrow_drop_down),),

        ],
      );
      
        }});
      }
      }

