import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_management_firebase/model/model.dart';
import 'package:event_management_firebase/services/service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  FirebaseService _firebaseService = FirebaseService();
  String uniquename = DateTime.now().microsecondsSinceEpoch.toString();
  String downloadurl = '';

  Stream<QuerySnapshot<EventModel>> getData() {
    return _firebaseService.eventRef.snapshots();
  }

  void addStudent(EventModel student) async {
    await _firebaseService.eventRef.add(student);
    notifyListeners();
  }

  void deleteStudent(String id) async {
    await _firebaseService.eventRef.doc(id).delete();
    notifyListeners();
  }

  void updateStudent(String id, EventModel student) async {
    await _firebaseService.eventRef.doc(id).update(student.toJson());
    notifyListeners();
  }

  imageAdder(image) async {
    //for the image saving path  .ref().child('images'); refrence and the folder name image
    Reference folder = _firebaseService.storage.ref().child('images');
    Reference images = folder.child("$uniquename.jpg");
    try {
      await images.putFile(image);
      downloadurl = await images.getDownloadURL();
      notifyListeners();
      // ignore: avoid_print
      print(downloadurl);
    } catch (e) {
      throw Exception(e);
    }
  }
}
