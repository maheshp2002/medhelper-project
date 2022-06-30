import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:medbuddy/src/ui/consult/controller.dart';
import 'package:medbuddy/src/ui/consult/specmap.dart';

class FirestoreController extends GetxController {
  //referance to firestore collection here laptop is collection name
  final CollectionReference _specRef =
      FirebaseFirestore.instance.collection('consultDoctors');

  var specList = <specmap>[].obs;

  //dependency injection with getx
  Controller _Controller = Get.put(Controller());

  @override
  void onInit() {
    //binding to stream so that we can listen to realtime cahnges

    specList.bindStream(
        getspec(specsmap.values[_Controller.selectedSpec]));
    super.onInit();
  }

// this fuction retuns stream of laptop lsit from firestore

  Stream<List<specmap>> getspec(specsmap spec) {
    //using enum class LaptopBrand in switch case
    switch (spec) {
      case specsmap.All:
        Stream<QuerySnapshot> stream = _specRef.snapshots();
        return stream.map((snapshot) => snapshot.docs.map((snap) {
              return specmap.fromDocumentSnapshot(snap);
            }).toList());
      case specsmap.ortho:
        Stream<QuerySnapshot> stream =
            _specRef.where('specialization', isEqualTo: 'ortho').snapshots();
        return stream.map((snapshot) => snapshot.docs.map((snap) {
              return specmap.fromDocumentSnapshot(snap);
            }).toList());                      
      case specsmap.derma:
        Stream<QuerySnapshot> stream =
            _specRef.where('specialization', isEqualTo: 'derma').snapshots();
        return stream.map((snapshot) => snapshot.docs.map((snap) {
              return specmap.fromDocumentSnapshot(snap);
            }).toList());
      case specsmap.pedia:
        Stream<QuerySnapshot> stream =
            _specRef.where('specialization', isEqualTo: 'pedia').snapshots();
        return stream.map((snapshot) => snapshot.docs.map((snap) {
              return specmap.fromDocumentSnapshot(snap);
            }).toList());
      case specsmap.neuro:
        Stream<QuerySnapshot> stream =
            _specRef.where('specialization', isEqualTo: 'neuro').snapshots();
        return stream.map((snapshot) => snapshot.docs.map((snap) {
              return specmap.fromDocumentSnapshot(snap);
            }).toList());
      case specsmap.gastro:
        Stream<QuerySnapshot> stream =
            _specRef.where('specialization', isEqualTo: 'gastro').snapshots();
        return stream.map((snapshot) => snapshot.docs.map((snap) {
              return specmap.fromDocumentSnapshot(snap);
            }).toList());    
    }
  }
}