import 'package:cloud_firestore/cloud_firestore.dart';

//Laptop model class

class specmap {
  String name;
  String regno;
  String docid;
  String image;
  String specialization;


  specmap(this.regno, this.image, this.name, this.docid, this.specialization);

//Funtion for loading firestore data and conver to model object

  specmap.fromDocumentSnapshot(QueryDocumentSnapshot snapshot) {
    //feild name should be exactly same as you given in friebase

    name = snapshot.get('doctor name');
    regno = snapshot.get('regno');
    docid = snapshot.id;
    image = snapshot.get('images');
    specialization = snapshot.get('specialization');
  }
}

//enum class for better filtering

enum specsmap { All, ortho, derma, pedia, gastro, neuro }