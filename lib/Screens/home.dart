import 'package:flutter/material.dart';
import 'package:newsapi/Colors/colors.dart';
import 'package:newsapi/api/apifetcher.dart';
import 'package:newsapi/model/catagories.dart';
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
  Catagories newcatagory = Catagories.general;

  void fatchapi() async {
    isloading = true;
    Map<String, String> quary = {
      " country": "in",
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

  var currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
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
              Container(
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
                        fontFamily: "VarelaRound",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(icon: Icon(Icons.search), onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
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
        },
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
      ),
    );
  }
}
