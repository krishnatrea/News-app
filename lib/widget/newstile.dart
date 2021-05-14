import 'package:flutter/material.dart';
import 'package:newsapi/model/newsclass.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    Key key,
    @required this.news,
  }) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(20),
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
    );
  }
}
