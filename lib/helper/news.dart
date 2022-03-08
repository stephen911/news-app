import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_api/models/article.dart';
import 'dart:convert';

import 'package:news_app_api/secret.dart';

class News {
  List<Article> news = [];
  //String country = "us";

  Future<void> getNews(String country) async {
    // String url = "https://newsapi.org/v2/top-headlines?country=$country&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=$apiKey";
    String url =
        "https://newsapi.org/v2/top-headlines?country=$country&apiKey=$apiKey";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

class NewsForCategorie {
  //String country = "us";
  List<Article> news = [];

  Future<void> getNewsForCategory(String category, String country) async {
    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url =
        "http://newsapi.org/v2/top-headlines?country=${country}&category=$category&apiKey=${apiKey}";
    int timeout = 2;
    try {
      var response = await http.get(url);
      Duration(seconds: timeout);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        // print(country);
        // print(category);
        // print(apiKey);
        // print(jsonData);

        if (jsonData['status'] == "ok") {
          jsonData["articles"].forEach((element) {
            if (element['urlToImage'] != null &&
                element['description'] != null) {
              Article article = Article(
                title: element['title'],
                author: element['author'],
                description: element['description'],
                urlToImage: element['urlToImage'],
                publshedAt: DateTime.parse(element['publishedAt']),
                content: element["content"],
                articleUrl: element["url"],
              );
              news.add(article);
            }
          });
        }
      } else {
        // handle status code error
        
        Error(error: "No Internet Connection");
        print("No internet connection");
      }
    } on TimeoutException catch (e) {
      return Center(child: Text("Connection Timeout " + e.toString()));
    } on SocketException catch (e) {
      return Center(child: Text("Socket unavailable " + e.toString()));
    } on Error catch (e) {
      return Center(child: Text("Sorry and error has occurred " + e.toString()));
    }
  }
}
