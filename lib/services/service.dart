// firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_management_firebase/model/model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  String collectionRef = 'event';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  late final CollectionReference<EventModel> eventRef;

  FirebaseService() {
    eventRef = firestore.collection(collectionRef).withConverter<EventModel>(
          fromFirestore: (snapshot, options) =>
              EventModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, options) => value.toJson(),
        );
  }
}
