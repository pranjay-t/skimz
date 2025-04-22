import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:skimz/models/news_query_model.dart';

final newsRepositoryProvider = Provider((ref) {
  return NewsRepository();
});



class NewsRepository extends StateNotifier<List<NewsQueryModel>> {
  NewsRepository() : super([]);

  Future<List<NewsQueryModel>> fetchLatestNews() async {
    const String url =
        "https://newsapi.org/v2/everything?domains=aajtak.in&apiKey=372aa90d06e747928c013d4d12eb73e0";

    try {
      final response = await http.get(Uri.parse(url));

      
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> articles = data["articles"];

        final List<NewsQueryModel> newsList =
            articles.map((article) => NewsQueryModel.fromMap(article)).toList();

        return newsList;
    } catch (e) {
      print("Error fetching news: $e");
      return [];
    }
  }


  Future<List<NewsQueryModel>> fetchCarouselNews() async {
    String url =
        "https://newsapi.org/v2/everything?domains=screenrant.com&language=en&apiKey=372aa90d06e747928c013d4d12eb73e0";

    try {
      final response = await http.get(Uri.parse(url));
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> articles = data["articles"];

      final List<NewsQueryModel> indiaNewsList =
          articles.map((article) => NewsQueryModel.fromMap(article)).toList();

      return indiaNewsList;
    } catch (e) {
      print("Error fetching India news: $e");
      return [];
    }
  }

}
