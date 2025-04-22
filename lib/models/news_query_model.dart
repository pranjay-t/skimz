import 'dart:convert';

class NewsQueryModel {
  final String newsHead;
  final String newsDes;
  final String newsImg;
  final String newsUrl;
  final String newsAuthor;
  final String newsPublishedAt;

  NewsQueryModel({
    required this.newsHead,
    required this.newsDes,
    required this.newsImg,
    required this.newsUrl,
    required this.newsAuthor,
    required this.newsPublishedAt,
  });

  factory NewsQueryModel.fromMap(Map news) {
    return NewsQueryModel(
      newsHead: news["title"],
      newsDes: news["description"],
      newsImg: news["urlToImage"],
      newsUrl: news["url"],
      newsAuthor: news["source"]["name"],
      newsPublishedAt: news["publishedAt"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": newsHead,
      "description": newsDes,
      "urlToImage": newsImg,
      "url": newsUrl,
      "source": {"name": newsAuthor},
      "publishedAt": newsPublishedAt,
    };
  }

  String toJson() => json.encode(toMap());

  factory NewsQueryModel.fromJson(String source) =>
      NewsQueryModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsQueryModel && other.newsUrl == newsUrl;
  }

  @override
  int get hashCode => newsUrl.hashCode;
}
