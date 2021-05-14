import 'package:flutter/material.dart';
import 'package:newsapi/Colors/colors.dart';
import 'package:newsapi/model/newsclass.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    Key key,
    @required this.news,
    @required this.currentindex,
  }) : super(key: key);

  final News news;
  final int currentindex;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                new BoxShadow(
                  color: colors[currentindex],
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    news.urltoimage,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
<<<<<<< HEAD
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    news.title,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "VarelaRound",
                      fontWeight: FontWeight.bold,
                    ),
=======
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  news.title,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
>>>>>>> 77e865d31bffca1b0c79cd54960593b5b80a2550
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    news.description,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "VarelaRound",
                      color: Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
