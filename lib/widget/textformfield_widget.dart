import 'package:event_management_firebase/controllers/add_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Widget customTextFormField(
    {controller,
    labelText,
    maxlength,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType}) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Value is empty';
      } else {
        return null;
      }
    },
    controller: controller,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    maxLength: maxlength,
    decoration: InputDecoration(
      labelStyle: TextStyle(color: Color.fromARGB(255, 26, 58, 118)),
      labelText: labelText,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 26, 58, 118)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 26, 58, 118)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 26, 58, 118)),
      ),
    ),
  );
}

Widget dropDown(AddProvider addProvider) {
  return Consumer<AddProvider>(builder: (context, addValue, child) {
    return DropdownButtonFormField(
      validator: (value) {
        if (value == null) {
          return "choose a plan";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text('Event type')),
      value: addValue.selectedValue,
      items: <String>['Wedding', 'Engagement', 'House warming']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          addValue.setSelectedValue(newValue);
        }
      },
    );
  });
}
