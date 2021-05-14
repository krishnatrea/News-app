import 'package:flutter/material.dart';
import 'package:newsapi/Screens/first.dart';
import 'Screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter news app",
      home: First(),
    ),
  );
}
