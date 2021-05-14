import 'package:flutter/material.dart';
import 'package:newsapi/Colors/colors.dart';

class BottomNavo extends StatelessWidget {
  const BottomNavo({
    Key key,
    @required this.currentindex,
    @required this.onTapFunction,
  }) : super(key: key);

  final int currentindex;
  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTapFunction,
      currentIndex: currentindex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: "Home",
            backgroundColor: colors[currentindex]),
        BottomNavigationBarItem(
          icon: Icon(Icons.business, color: Colors.black),
          label: "Business",
          backgroundColor: colors[currentindex],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_hospital, color: Colors.black),
          label: "Health",
          backgroundColor: colors[currentindex],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.science, color: Colors.black),
          label: "Science",
          backgroundColor: colors[currentindex],
        ),
      ],
    );
  }
}
