
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:medbuddy/src/global_bloc.dart';
import 'package:medbuddy/src/models/medicine.dart';
import 'package:medbuddy/src/ui/homepage/calender.dart';
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


class TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return 
      Column(
        children: <Widget>[

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
           alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
              Text(DateFormat.yMMMMd().format(DateTime.now()),
              style: TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black54,fontFamily: "Ic"
                ),
              ),
              //SizedBox(width: 100,),
              Container(alignment: Alignment.topRight,child: 
              InkWell(splashColor: Colors.grey,
                 child: Icon(Icons.calendar_today_rounded, color: Colors.grey,),
                onTap: (){
                  istrue = false;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Calender()));})),
              ],),
             
              Text("Today",
               style: TextStyle(
              fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black54,fontFamily: "Ic"
              ),
              ),
              
            ]),
          ),
        Container(
        margin: const EdgeInsets.only(top: 20, left: 20),
        
        child: InkWell(
                 onDoubleTap: (){
                  istrue = false;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Calender()));},         
          child: 
        DatePicker(
          DateTime.now(),
          height: 100,
          width: 80,
          //onDateChange: Navigator.push(context, MaterialPageRoute(builder: (context)=> Calender())),
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.deepPurple,
          //Colors.green,
          selectedTextColor: Colors.white,
          dateTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey
        ),
      ),)
        ),
      //),
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
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return  AnimationConfiguration.staggeredList(
                  position: index,
  
                child: snapshot.data[index].id == user.email?
                MedicineCard(snapshot.data[index]):SizedBox()
                );
              },
             
            ));
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
          IconData(0xec38, fontFamily: "Icmed"),
          color: Colors.deepPurple,
          //Color(0xFF3EB16F),
          size: size,
        ),
      );
    } else if (medicine.medicineType == "Pill") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Icon(
          IconData(0xec12, fontFamily: "Icmed"),
          color: Colors.deepPurple,
          //Color(0xFF3EB16F),
          size: size,
        ),
      );
    } else if (medicine.medicineType == "Syringe") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Icon(
          IconData(0xec24, fontFamily: "Icmed"),
          color: Colors.deepPurple,
          //Color(0xFF3EB16F),
          size: size,
        ),
      );
    } else if (medicine.medicineType == "Tablet") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Icon(
          IconData(0xec1b, fontFamily: "Icmed"),
          color: Colors.deepPurple,
          //Color(0xFF3EB16F),
          size: size,
        ),
      );
    }else if (medicine.medicineType == "Drops") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Icon(
          IconData(0xec0d, fontFamily: "Icmed"),
          color: Colors.deepPurple,
          //Color(0xFF3EB16F),
          size: size,
        ),
      );
    } else if (medicine.medicineType == "Oinment") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Icon(
          IconData(0xec27, fontFamily: "Icmed"),
          color: Colors.deepPurple,
          //Color(0xFF3EB16F),
          size: size,
        ),
      );
    } else if (medicine.medicineType == "Other") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Icon(
          IconData(0xec1c, fontFamily: "Icmed"),
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
        child: Card(
              margin: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,          
        //Container(
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.circular(15),
          // ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 10,),
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
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
