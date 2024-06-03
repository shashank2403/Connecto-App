import 'package:flutter/material.dart';

const TextStyle headingStyle_1 = TextStyle(fontSize: 25, fontWeight: FontWeight.w900);
const TextStyle headingStyle_2 = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);

const Color themePrimaryColor = Colors.purple;
const InputDecoration inputFieldDecoration = InputDecoration(
  prefixIconColor: Colors.black,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: themePrimaryColor,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(
        24.0,
      ),
    ),
  ),
  filled: true,
  fillColor: Color.fromARGB(255, 230, 230, 230),
  prefixIcon: Icon(Icons.search),
  hintText: "Search for events",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        24.0,
      ),
    ),
  ),
);
