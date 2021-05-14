import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapi/model/newsclass.dart';
import 'dart:convert';

class FetchApi {
  static const String baseapi = "newsapi.org";
<<<<<<< HEAD
  static const String apikeybinding = "5adfe4d2fc8a4943ad1bccb28be16b1a";
=======
  static const String apikeybinding = "Your API key";
>>>>>>> 77e865d31bffca1b0c79cd54960593b5b80a2550

  Future<List<News>> fatchingapis(
      {@required String endpoint, @required Map<String, dynamic> quary}) async {
    quary['apikey'] = apikeybinding;
    Uri uri = Uri.https(baseapi, endpoint, quary);
    var responce = await http.get(uri);
    if (responce.statusCode == 200) {
      return jasontoListNewsConverter(jsonDecode(responce.body));
    } else
      throw Exception("error");
  }
}
