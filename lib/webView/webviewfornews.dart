import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';

class WebViewForNews extends StatefulWidget {
  final String url;

  const WebViewForNews({Key key, this.url}) : super(key: key);
  @override
  WebViewForNewsState createState() => WebViewForNewsState();
}

class WebViewForNewsState extends State<WebViewForNews> {
  WebViewForNewsState();

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: widget.url,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
