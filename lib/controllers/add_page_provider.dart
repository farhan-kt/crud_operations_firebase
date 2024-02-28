import 'dart:io';

import 'package:event_management_firebase/controllers/event_provider.dart';
import 'package:event_management_firebase/controllers/image_provider.dart';
import 'package:event_management_firebase/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String selectedValue = 'Wedding';

  void setSelectedValue(String val) {
    selectedValue = val;
    notifyListeners();
  }

  void clearTextField() {
    nameController.clear();
    placeController.clear();
    phoneController.clear();
  }

  void addStudent(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context, listen: false);
    final imageProvider = Provider.of<ImageProviderr>(context, listen: false);
    final name = nameController.text;
    final place = placeController.text;
    final phone = phoneController.text;
    final eventtype = selectedValue;

    eventProvider.imageAdder(File(imageProvider.selectedImage!.path));

    final event = EventModel(
        phone: phone,
        place: place,
        name: name,
        image: eventProvider.downloadurl,
        eventType: eventtype);
    eventProvider.addStudent(event);
    clearTextField();
    imageProvider.selectedImage = null;
  }
}
