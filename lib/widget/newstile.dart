import 'package:flutter/material.dart';
import 'package:newsapi/Colors/colors.dart';
import 'package:newsapi/model/newsclass.dart';
import 'package:newsapi/webView/webviewfornews.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WebViewForNews(url: news.url)));
      },
      child: Padding(
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
        ),
      ),
    );
  }
}
