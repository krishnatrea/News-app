import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  void initState() {
    super.initState();
    setTime();
  }

  @override
  setTime() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("fonts/news.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(7),
              child: Text(
                "FLUTTER NEWS",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 42,
                  color: Color(0xffdd0426),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
