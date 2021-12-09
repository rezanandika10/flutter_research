import 'package:flutter_research/feature/pull_refresh/data/api/news_api.dart';
import 'package:flutter_research/feature/pull_refresh/model/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsRepo {
  Future<NewsModel> getNews() async {
    final res = await http.Client().get(NewsApi().newsApi);
    if (res.statusCode == 200) {
      return NewsModel.fromJson(jsonDecode(res.body));
    } else {
      throw Exception();
    }
  }
}
