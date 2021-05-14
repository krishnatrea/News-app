import 'package:flutter/material.dart';
import 'package:newsapi/Colors/colors.dart';

class AppBarForNews extends StatelessWidget {
  const AppBarForNews({
    Key key,
    @required this.currentindex,
  }) : super(key: key);

  final int currentindex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: colors[currentindex],
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(icon: Icon(Icons.person), onPressed: () {}),
          Text(
            "FLUTTER NEWS",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: colors[currentindex],
            ),
          ),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
    );
  }
}
