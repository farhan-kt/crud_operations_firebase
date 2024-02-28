import 'dart:io';
import 'package:event_management_firebase/controllers/add_page_provider.dart';
import 'package:event_management_firebase/controllers/image_provider.dart';
import 'package:event_management_firebase/views/listscreen/home_screen.dart';
import 'package:event_management_firebase/widget/text_style_widget.dart';
import 'package:event_management_firebase/widget/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageProviderr>(context, listen: false);
    final addProvider = Provider.of<AddProvider>(context, listen: false);
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textTitle(data: 'Add Event', size: 25),
              SizedBox(
                height: mediaQuery.height * 0.8,
                width: mediaQuery.width * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (imageProvider.selectedImage == null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              child: Lottie.asset('asset/image add.json',
                                  fit: BoxFit.fill),
                              height: mediaQuery.height * 0.25,
                              width: mediaQuery.width * 0.8,
                            )),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            File(imageProvider.selectedImage!.path),
                            height: mediaQuery.height * 0.2,
                            width: mediaQuery.width * 0.8,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 26, 58, 118)),
                          onPressed: () {
                            imageProvider.setImage(ImageSource.camera);
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          label: textPoppins(
                            data: 'Camera',
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 14.0),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 26, 58, 118)),
                          onPressed: () {
                            imageProvider.setImage(ImageSource.gallery);
                          },
                          icon: const Icon(Icons.photo, color: Colors.white),
                          label:
                              textPoppins(data: 'Gallery', color: Colors.white),
                        ),
                      ],
                    ),
                    customTextFormField(
                        controller: addProvider.nameController,
                        labelText: 'Name'),
                    customTextFormField(
                        controller: addProvider.placeController,
                        labelText: 'place'),
                    dropDown(addProvider),
                    customTextFormField(
                        controller: addProvider.phoneController,
                        labelText: 'Phone ',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxlength: 10,
                        keyboardType: TextInputType.number),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 26, 58, 118)),
                      onPressed: () {
                        addProvider.addStudent(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: textPoppins(data: 'ADD', color: Colors.white)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
