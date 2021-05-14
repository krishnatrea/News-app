import 'package:flutter/material.dart';
import 'package:newsapi/api/apifetcher.dart';
import 'package:newsapi/model/catagories.dart';
import 'package:newsapi/model/countrycods.dart';
import 'package:newsapi/model/newsclass.dart';
import 'package:newsapi/widget/newstile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FetchApi fetchApi = FetchApi();
  List<News> news;
  String endpoint = "/v2/top-headlines";
  bool isloading = true;
  Map<String, String> quary = {
    " country": "in",
    "category": enumCatagriestoString(Catagories.general),
  };

  void fatchapi() async {
    await fetchApi.fatchingapis(endpoint: endpoint, quary: quary).then((value) {
      news = value;
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fatchapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.person), onPressed: () {}),
                    Text(
                      "FLUTTER NEWS",
                      style: TextStyle(
                        fontFamily: "VarelaRound",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(icon: Icon(Icons.search), onPressed: () {}),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              isloading
                  ? CircularProgressIndicator()
                  : Container(
                      height: MediaQuery.of(context).size.height - 80,
                      width: double.infinity,
                      child: GridView.count(
                        crossAxisCount: 1,
                        children: List.generate(
                          7,
                          (index) => NewsTile(
                            news: news[index],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
