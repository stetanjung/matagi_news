import 'package:flutter/material.dart';

final kTextFieldInputDecoration = InputDecoration(
  filled: true,
  icon: Icon(
    Icons.search,
    color: Colors.black,
  ),
  hintText: 'What would you like to search?',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide.none,
  ),
);
