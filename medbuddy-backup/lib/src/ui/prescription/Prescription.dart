
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medbuddy/src/ui/login_page/register.dart';
import 'package:medbuddy/src/ui/medicine_webpages/NMC.dart';
import 'package:medbuddy/src/ui/prescription/prescTile.dart';
import 'package:medbuddy/src/ui/tabpage/tabs.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:url_launcher/url_launcher.dart';

class Prescription extends StatefulWidget {
  @override
    _PrescriptionState createState() => _PrescriptionState();
}


String prescription;

class _PrescriptionState extends State<Prescription> {

@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: AddData(),
	);
}
}

class AddData extends StatelessWidget {
  final collectionReference = FirebaseFirestore.instance.collection(user.email).snapshots();

  String date = preindexno['date'];
  String dcname = preindexno['doctor name'];
  String prescription = preindexno['prescription'];
  String regno = preindexno['regno'];
  String email = preindexno['email'];
  String sign = preindexno['sign'];

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
        actions: [
          new IconButton(
          icon: new Icon(Icons.domain_verification),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NMC()),
            );
          },
        ),

        ],
        title: Text(
          "Prescription",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
  ),
	body: Container(
    
    child: ListView(children: [

          const SizedBox(
            height: 16,
          ),
            Row(children: [
          Icon(Icons.warning_amber_outlined,color: Colors.grey,size: 10,),
          Text("Note: Since there are chances for fake doctors to send prescription",
          style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans',fontSize: 10),),        
            ]),
          Text("always verify if the doctor is real using register number.",
          style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans',fontSize: 10),),
          Text("Click on verify icon in appbar.",
          style: TextStyle(color: Colors.grey,fontFamily: 'JosefinSans',fontSize: 10),),             
            const SizedBox(
              height: 10,
            ),

    Card(
    child: ListTile(
    title:  Text("Date: " + " " + preindexno['date']),),),//gap btw borders
          const SizedBox(
            height: 16,
          ),  
    Card(
    child: ListTile(              
    title:  Text("Doctor name: " + " " + preindexno['doctor name']),
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),
    Card(
    child: ListTile(              
    title:  Text("Register no: " + " " + preindexno['regno']),
    trailing: Icon(Icons.arrow_forward_ios),
    onTap: (){
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NMC()),
            );
    },
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),          
    Card(
    child: ListTile(              
    title:  Text("Doctor email: " + " " + preindexno['email']),
    trailing: Icon(Icons.arrow_forward_ios),
    onTap: (){
      _sendingMails();
    },
    )),
//gap btw borders
          const SizedBox(
            height: 16,
          ),   
    Card(
    child: ListTile(              
    title:  Text("Prescription: " + " " + preindexno['prescription']),
    )),


    ]),
),
        floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: Colors.deepPurple,
        child: Icon(
          Icons.picture_as_pdf_outlined,
        ),
        onPressed: _createPDF
        )
    );
}
  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
    document.pageSettings.size = PdfPageSize.a4;

// final PdfLayoutResult layoutResult = PdfTextElement(
//         text: dcname,
//         font: PdfStandardFont(PdfFontFamily.helvetica, 12),
//         brush: PdfSolidBrush(PdfColor(0, 0, 0)))
//     .draw(
//         page: page,
//         bounds: Rect.fromLTWH(
//             0, 0, page.getClientSize().width, page.getClientSize().height),
//         format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate));

    //Get page client size
    final Size pageSize = page.getClientSize();
    //Draw rectangle
    page.graphics.drawRectangle(
        bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
        pen: PdfPen(PdfColor(142, 170, 219)));
    //Generate PDF grid.
    //final PdfGrid grid = getGrid();
    //Draw the header section by creating text element
    final PdfLayoutResult result = drawHeader(page, pageSize);

//.........................................................................
//header image
    page.graphics.drawRectangle(
    bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 110),
    brush: PdfBrushes.violet);

    //draw image
    page.graphics.drawImage(
        PdfBitmap(await _readImageData1('MH_logo.png')),
        Rect.fromLTWH(405, 5, pageSize.width - 410, 100));
//.........................................................................
       
    //Draw string
    page.graphics.drawString(
        'Date: ' + date, PdfStandardFont(PdfFontFamily.helvetica, 20),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(25, 0, pageSize.width - 115, 300),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

     //Draw string
    page.graphics.drawString(
        'Prescription: ', PdfStandardFont(PdfFontFamily.helvetica, 20),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(25, 10, pageSize.width - 115, 350),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));       

     //Draw string
    page.graphics.drawString(
        prescription, PdfStandardFont(PdfFontFamily.helvetica, 20),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(25, 280, pageSize.width - 50, 520),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));   

//............................................................................
//footer
    final PdfPen linePen =
        PdfPen(PdfColor(142, 170, 219), dashStyle: PdfDashStyle.custom);
    linePen.dashPattern = <double>[3, 3];
    //Draw line
    page.graphics.drawLine(linePen, 
        Offset(0, pageSize.height - 80),
        Offset(pageSize.width, pageSize.height - 80));

    //draw image
    page.graphics.drawImage(
        PdfBitmap(await _readImageData(sign)),
        Rect.fromLTWH(300, 680, 220, 100));

//............................................................................
//save
    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, dcname + '_' + date + '.pdf');
  }
  
   //Draws the invoice header
  PdfLayoutResult drawHeader(PdfPage page, Size pageSize) {
    //Draw rectangle
    page.graphics.drawRectangle(
        brush: PdfBrushes.violet,
        bounds: Rect.fromLTWH(0, 0, pageSize.width - 115, 110));
        
    //Draw string
    page.graphics.drawString(
        dcname, PdfStandardFont(PdfFontFamily.helvetica, 20),
        brush: PdfBrushes.white,
        bounds: Rect.fromLTWH(25, 0, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //Draw string
    page.graphics.drawString(
        'Reg no: ' + regno, PdfStandardFont(PdfFontFamily.helvetica, 15),
        brush: PdfBrushes.white,
        bounds: Rect.fromLTWH(25, 20, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));        

     //Draw string
    page.graphics.drawString(
        'Email-ID: ' + email, PdfStandardFont(PdfFontFamily.helvetica, 15),
        brush: PdfBrushes.white,
        bounds: Rect.fromLTWH(25, 40, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));         

    // page.graphics.drawRectangle(
    //     bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 110),
    //     brush: PdfBrushes.purple);

    // page.graphics.drawString('Medhelper',
    //     PdfStandardFont(PdfFontFamily.helvetica, 18),
    //     bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 100),
    //     brush: PdfBrushes.white,
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.middle));
    // page.graphics.drawImage(
    //     PdfBitmap(await _readImageData('Pdf_Succinctly.jpg')),
    //     Rect.fromLTWH(0, 100, 440, 550));
  }

  //Create PDF grid and return
  // PdfGrid getGrid() {
  //   //Create a PDF grid
  //   final PdfGrid grid = PdfGrid();
  //   //Secify the columns count to the grid.
  //   grid.columns.add(count: 5);
  //   //Create the header row of the grid.
  //   final PdfGridRow headerRow = grid.headers.add(1)[0];
  //   //Set style
  //   headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
  //   headerRow.style.textBrush = PdfBrushes.white;

  //   grid.applyBuiltInStyle(PdfGridBuiltInStyle.listTable4Accent5);
  //   //Set gird columns width
  //   grid.columns[1].width = 200;
  //   // for (int i = 0; i < headerRow.cells.count; i++) {
  //   //   headerRow.cells[i].style.cellPadding =
  //   //       PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
  //   // }
  //   // for (int i = 0; i < grid.rows.count; i++) {
  //   //   final PdfGridRow row = grid.rows[i];
  //   //   for (int j = 0; j < row.cells.count; j++) {
  //   //     final PdfGridCell cell = row.cells[j];
  //   //     if (j == 0) {
  //   //       cell.stringFormat.alignment = PdfTextAlignment.center;
  //   //     }
  //   //     cell.style.cellPadding =
  //   //         PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
  //   //   }
  //   // }
  //   return grid;
  // }

}
//........................................................................
//file save
  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  final path = (await getExternalStorageDirectory()).path;
  final file = File('$path/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  OpenFile.open('$path/$fileName');
} 

//..........................................................................
//image
Future<Uint8List> _readImageData1(String name) async {
  final data = await rootBundle.load('assets/logo/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
//..........................................................................
Future<Uint8List> _readImageData(String imageUrl) async {
//String imageUrl = "https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png";

Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imageUrl))
            .load(imageUrl))
            .buffer
            .asUint8List();
  return bytes;
}
//...........................................................................     
/*

        showModalBottomSheet<void>(context: context,
            builder: (BuildContext context) {
                return Container(
                    child: new Wrap(
                    children: <Widget>[
                        new ListTile(
                        leading: new Icon(Icons.delete),
                        title: new Text('Delete'),
                        onTap: () =>*/

_sendingMails()  {
String encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: preindexno['email'],
  query: encodeQueryParameters(<String, String>{
    'subject': 'medhelper'
  }),
);

launchUrl(emailLaunchUri);
}