import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DataFeed extends StatefulWidget {
  const DataFeed({ Key key}) : super(key: key);

  @override
  DataState createState() => DataState();
}

class DataState extends State<DataFeed>{


//Controller
TextEditingController _id = new TextEditingController();
TextEditingController _name = new TextEditingController();
TextEditingController _address = new TextEditingController();
TextEditingController _policyno = new TextEditingController();
TextEditingController _table = new TextEditingController();
TextEditingController _term = new TextEditingController();
TextEditingController _mobileno = new TextEditingController();
TextEditingController _mode = new TextEditingController();
TextEditingController _amount = new TextEditingController();

DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Data Feed"),
    ),
//page UI
      body: Column(
    children: [
      Flexible(
        child: ListView(
            children: [
          Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),

     child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

//id
          TextField(
            controller: _id,
              decoration: InputDecoration(
                  hintText: "ID",
                  labelText: "ID",
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                  ),
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
            maxLength: 10,
          ),
//gap btw borders
          SizedBox(
            height: 16,
          ),
//name
          TextField(
            controller: _name,
            decoration: InputDecoration(
              hintText: "Your Name",
              labelText: "Name",
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
                border: OutlineInputBorder()
            ),

          ),
//gap btw borders
          SizedBox(
            height: 16,
          ),
//address
          TextField(
            controller: _address,
            decoration: InputDecoration(
                hintText: "Your Address",
                labelText: "Address",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: UnderlineInputBorder()
            ),

            maxLines: 3,
          ),
//gap btw borders
          SizedBox(
            height: 16,
          ),
//policy no.
          TextField(
            controller: _policyno,
            decoration: InputDecoration(
                hintText: "Policy number",
                labelText: "Policy No.",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: OutlineInputBorder()
            ),

            maxLength: 15,
            keyboardType: TextInputType.number,
          ),
//gap btw borders
          SizedBox(
            height: 16,
          ),
//Term and table

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Flexible(
              child:
//table
          new TextField(
            controller: _table,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                hintText: "Table",
                labelText: "Table",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: OutlineInputBorder()
            ),

            maxLength: 15,
            keyboardType: TextInputType.number,

          ),
            ),
//Term
          new Flexible(
            child:
       new  TextField(
          controller: _term,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              hintText: "Term",
              labelText: "Term",
              labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black
              ),
              border: OutlineInputBorder()
          ),

          maxLength: 15,
          keyboardType: TextInputType.number,
        ),
          ),
],
        ),


//gap btw borders
          SizedBox(
            height: 16,
          ),
//mobile no
          TextField(
            controller: _mobileno,
            decoration: InputDecoration(
                hintText: "Your Mobile Number",
                labelText: "Mobile No.",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: OutlineInputBorder()
            ),

            maxLength: 15,
            keyboardType: TextInputType.number,
          ),
//gap btw borders
          SizedBox(
            height: 16,
          ),
//premium paging mode
          TextField(
            controller: _mode,
            decoration: InputDecoration(
                hintText: "eg:monthly, quaterly, yearly",
                labelText: "Mode",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: OutlineInputBorder()
            ),

          ),
//gap btw borders
          SizedBox(
            height: 16,
          ),
//premium amount
          TextField(
            controller: _amount,
            decoration: InputDecoration(
                hintText: "Premium amount",
                labelText: "Amount",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                border: OutlineInputBorder()
            ),

            maxLength: 15,
            keyboardType: TextInputType.number,
          ),
//gap btw borders
            SizedBox(
              height: 16,
            ),
//Date
 

//gap btw borders
          SizedBox(
            height: 16,
          ),


//Submit Button
          ElevatedButton(
          child: Text('Submit'),
              
          )
        ],
      ),
          ),
            ],
        ),
  ),
    ],
      ),


);
  }}
 

