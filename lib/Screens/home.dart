import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsapi/api/apifetcher.dart';
import 'package:newsapi/model/catagories.dart';
import 'package:newsapi/model/countrycods.dart';
import 'package:newsapi/model/newsclass.dart';
import 'package:newsapi/widget/appBarfornews.dart';
import 'package:newsapi/widget/navbar.dart';
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
  Catagories newcatagory = Catagories.general;

  void fatchapi() async {
    isloading = true;
    Map<String, String> quary = {
      " country": enumCountrytostring(Country.us),
      "category": enumCatagriestoString(newcatagory),
    };
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

  onTapFunction(value) {
    currentindex = value;
    switch (value) {
      case 0:
        newcatagory = Catagories.general;
        break;
      case 1:
        newcatagory = Catagories.business;
        break;
      case 2:
        newcatagory = Catagories.health;
        break;
      case 3:
        newcatagory = Catagories.science;
    }
    fatchapi();

    setState(() {});
  }

  var currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              AppBarForNews(currentindex: currentindex),
              isloading
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: Container(
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: news.length,
                            itemBuilder: (context, index) => NewsTile(
                                news: news[index], currentindex: currentindex)),
                      ),
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavo(
        currentindex: currentindex,
        onTapFunction: onTapFunction,
      ),
    );
  }
}
