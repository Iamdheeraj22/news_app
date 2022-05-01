import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=25a68c10a6494a1ca29aa6eec08db704";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["author"] != null &&
            element["urlToImage"] != null &&
            element['description'] != null &&
            element["content"] != null &&
            element["title"] != null &&
            element["url"] != null) {
          ArticleModel model = ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"]);
          news.add(model);
        }
      });
    }
  }
}


class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getCategoriesNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=25a68c10a6494a1ca29aa6eec08db704";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["author"] != null &&
            element["urlToImage"] != null &&
            element['description'] != null &&
            element["content"] != null &&
            element["title"] != null &&
            element["url"] != null) {
          ArticleModel model = ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"]);
          news.add(model);
        }
      });
    }
  }
}