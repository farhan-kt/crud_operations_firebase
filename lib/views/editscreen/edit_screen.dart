// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:event_management_firebase/controllers/event_provider.dart';
import 'package:event_management_firebase/model/model.dart';
import 'package:event_management_firebase/widget/text_style_widget.dart';
import 'package:event_management_firebase/widget/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  EventModel event;
  String id;
  EditScreen({super.key, required this.id, required this.event});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.event.name ?? '';
    placeController.text = widget.event.place ?? '';
    phoneController.text = widget.event.phone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              customTextFormField(
                controller: nameController,
                labelText: 'Name',
              ),
              const SizedBox(
                height: 10,
              ),
              customTextFormField(
                controller: placeController,
                labelText: 'place',
              ),
              const SizedBox(
                height: 10,
              ),
              customTextFormField(
                controller: phoneController,
                labelText: 'phone no',
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 26, 58, 118)),
                  onPressed: () {
                    editStudent(context);
                  },
                  child: textPoppins(data: 'UPDATE', color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }

  editStudent(
    BuildContext context,
  ) async {
    final pro = Provider.of<EventProvider>(context, listen: false);

    try {
      final editedName = nameController.text;
      final editedPhone = phoneController.text;
      final editedPlace = placeController.text;
      final existingImage = widget.event.image;
      final existingEventType = widget.event.eventType;
      // Update image URL in Firestore

      final updatedstudent = EventModel(
          name: editedName,
          phone: editedPhone,
          place: editedPlace,
          image: existingImage,
          eventType: existingEventType);

      pro.updateStudent(widget.id, updatedstudent);

      Navigator.pop(context);
    } catch (e) {
      log("Error updating student: $e");
    }
  }
}
