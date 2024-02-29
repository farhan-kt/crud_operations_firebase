// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'dart:io';

import 'package:event_management_firebase/controllers/add_page_provider.dart';
import 'package:event_management_firebase/model/model.dart';
import 'package:event_management_firebase/widget/text_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final EventModel event;

  const DetailScreen({required this.event, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              textPoppins(data: event.name!.toUpperCase(), color: Colors.white),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 26, 58, 118),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: event.image != null
                      ? DecorationImage(
                          image: NetworkImage(event.image!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  event.name ?? '',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                leading: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 26, 58, 118),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text(
                  "Place",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  event.place ?? '',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                leading: Icon(
                  Icons.place,
                  color: Color.fromARGB(255, 26, 58, 118),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text(
                  "Event Type",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  event.eventType ?? '',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                leading: Icon(
                  Icons.sentiment_satisfied_alt,
                  color: Color.fromARGB(255, 26, 58, 118),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text(
                  "Phone No",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  event.phone ?? '',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                leading: Icon(
                  Icons.phone,
                  color: Color.fromARGB(255, 26, 58, 118),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
