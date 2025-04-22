import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skimz/models/news_query_model.dart';

final bookmarkRepositoryProvider = Provider((ref) {
  return BookmarkRepository();
});

class BookmarkRepository {
  static const _key = 'bookmarked_news';

  Future<void> saveBookmarks(List<NewsQueryModel> bookmarks) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final bookmarkStrings =
          bookmarks.map((e) => jsonEncode(e.toJson())).toList();
      await prefs.setStringList(_key, bookmarkStrings);
      for (var bookmark in bookmarkStrings) {
        print('Bookmark saveBookmarks: $bookmark');
      }
      print('All bookmarks saved successfully: ${bookmarkStrings.length}');
    } catch (e) {
      print('Failed to save bookmarks: $e');
      throw Exception('Failed to save bookmarks: $e');
    }
  }

  Future<List<NewsQueryModel>> fetchBookmarks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final bookmarkStrings = prefs.getStringList(_key) ?? [];
      final newsList =
          bookmarkStrings
              .map((e) => NewsQueryModel.fromJson(jsonDecode(e)))
              .toList();
      for (var bookmark in bookmarkStrings) {
        print('Bookmark fetchBookmarks: $bookmark');
      }
      return newsList;
    } catch (e) {
      print('Failed to load bookmarks: $e');
      // throw Exception('Failed to load bookmarks: $e');
      return [];
    }
  }
}
