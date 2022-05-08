
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:medbuddy/src/global_bloc.dart';
import 'package:medbuddy/src/models/medicine.dart';
import 'package:medbuddy/src/ui/homepage/navBar.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/medicine_details/medicine_details.dart';
import 'package:provider/provider.dart';




class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      
      drawer: NavDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        title: Text("MedHelper"),
        elevation: 16.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white, // Change Custom Drawer Icon Color
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        
      ),
      body: Container(
        color: Color(0xFFF6F8FC),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 3,
              child: TopContainer(),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 7,
              child: Provider<GlobalBloc>.value(
                child: BottomContainer(),
                value: _globalBloc,
              ),
            ),
          ],
        ),
      ),

      
    );
    
  }
}

//google fonts
/*TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold
    )
  );
}*/


class TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return /*Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(50, 27),
          bottomRight: Radius.elliptical(50, 27),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey[400],
            offset: Offset(0, 3.5),
          )
        ],
        color: Color(0xFF3EB16F),
      ),
      width: double.infinity,
      child: */
      Column(
        children: <Widget>[
          /*Flexible(child: 
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Text(
              "Medbuddy",
              style: TextStyle(
                fontFamily: "Angel",
                fontSize: 44,
                color: Colors.white,
              ),
            ),
          ),
          ),*/
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
           alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
              Text(DateFormat.yMMMMd().format(DateTime.now()),
              style: TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black54,fontFamily: "Ic"
                ),
              ),
             
              Text("Today",
               style: TextStyle(
              fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black54,fontFamily: "Ic"
              ),
              ),
              
            ]),
          ),
        Container(
        margin: const EdgeInsets.only(top: 20, left: 20),
        child: DatePicker(
          DateTime.now(),
          height: 100,
          width: 80,
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.deepPurple,
          //Colors.green,
          selectedTextColor: Colors.white,
          dateTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey
        ),
      ),
      ),
         /* Divider(
            color: Color(0xFFB0F3CB),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Center(
              child: Text(
                "Number of reminders",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
//...................................................................
//for firebase
   /* StreamBuilder(
		stream: FirebaseFirestore.instance.collection('medicine_name').snapshots(),
		builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
		if (!snapshot.hasData) {
			return Center(
			child: CircularProgressIndicator(),
			);
		}
        return Padding(
          padding: EdgeInsets.only(top: 16.0, bottom: 5 ),
		  child: Column(
			children: snapshot.data.docs.map((document) {
			return Container(
				child: Center(child: Text(document['medicine_name'])),
			);
			}).toList(),
      ),
		);
		},
	),*/


//...................................................................

          StreamBuilder<List<Medicine>>(
            stream: globalBloc.medicineList$,
            builder: (context, snapshot) {
              return Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 5 ),
                child: Center(
                  child: Text(
                    !snapshot.hasData ? '0' : snapshot.data.length.toString(),
                    style: TextStyle(
                      fontFamily: "Neu",
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),*/
        ],
    );
  }
}

class BottomContainer extends StatelessWidget {


  // BottomContainer(this.medicine);
  
  @override
  Widget build(BuildContext context) {
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);
    return StreamBuilder<List<Medicine>>(
      stream: _globalBloc.medicineList$,
      builder: (context, snapshot) {
        //final Medicine medicine=snapshot.data;
        if (!snapshot.hasData) {
          return Container();
        } else if (snapshot.data.length == 0) {
          return Container(
            color: Color(0xFFF6F8FC),
            child: Center(
              child: Text(
                "Press + to add a reminder",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFFC9C9C9),
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        } else {
          return  //medicine.id==user.uid
          //?
          Container(
            color: Color(0xFFF6F8FC),
            child: //GridView
            ListView.builder(
              padding: EdgeInsets.only(top: 12),
              //gridDelegate:
                  //SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return  AnimationConfiguration.staggeredList(
                  position: index,
  
                child: snapshot.data[index].id == user.email?
                MedicineCard(snapshot.data[index]):SizedBox()
                );
              },
             
            ));
          // ): Container(
          //   color: Color(0xFFF6F8FC),
          //   child: Center(
          //     child: Text(
          //       "Press + to add a reminder",
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //           fontSize: 24,
          //           color: Color(0xFFC9C9C9),
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // );
        }
      },
    );
  }
}

class MedicineCard extends StatelessWidget {
  final Medicine medicine;

  MedicineCard(this.medicine);

  Hero makeIcon(double size) {
    if (medicine.medicineType == "Bottle") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Icon(
          IconData(0xe900, fontFamily: "Ic"),
          color: Colors.deepPurple,
          //Color(0xFF3EB16F),
          size: size,
        ),
      );
    } else if (medicine.medicineType == "Pill") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Icon(
          IconData(0xe901, fontFamily: "Ic"),
          color: Colors.deepPurple,
          //Color(0xFF3EB16F),
          size: size,
        ),
      );
    } else if (medicine.medicineType == "Syringe") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Icon(
          IconData(0xe902, fontFamily: "Ic"),
          color: Colors.deepPurple,
          //Color(0xFF3EB16F),
          size: size,
        ),
      );
    } else if (medicine.medicineType == "Tablet") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Icon(
          IconData(0xe903, fontFamily: "Ic"),
          color: Colors.deepPurple,
          //Color(0xFF3EB16F),
          size: size,
        ),
      );
    }
    return Hero(
      tag: medicine.medicineName + medicine.medicineType,
      child: Icon(
        Icons.error,
        color: Colors.deepPurple,
        //Color(0xFF3EB16F),
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        highlightColor: Colors.white,
        splashColor: Colors.grey,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> MedicineDetails(medicine)));
          // Navigator.of(context).push(
          //   PageRouteBuilder<Null>(
          //     pageBuilder: (BuildContext context, Animation<double> animation,
          //         Animation<double> secondaryAnimation) {
          //       return AnimatedBuilder(
          //           animation: animation,
          //           builder: (BuildContext context, Widget child) {
          //             return Opacity(
          //               opacity: animation.value,
          //               child: MedicineDetails(medicine),
          //             );
          //           });
          //     },
          //     transitionDuration: Duration(milliseconds: 500),
          //   ),
          // );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                makeIcon(50.0),
                Hero(
                  tag: medicine.medicineName,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      medicine.medicineName,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.deepPurple,
                          //Color(0xFF3EB16F),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Text(
                  medicine.interval == 1
                      ? "Every " + medicine.interval.toString() + " hour"
                      : "Every " + medicine.interval.toString() + " hours",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFC9C9C9),
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
