// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:skimz/features/bookmark/repository/bookmark_repository.dart';
// import 'package:skimz/models/news_query_model.dart';

// final bookmarkControllerProvider =
//     StateNotifierProvider<BookmarkController, List<NewsQueryModel>>((ref) {
//   return BookmarkController(
//     repository: ref.watch(bookmarkRepositoryProvider),
//   );
// });

// final bookmarkNewsProvider = FutureProvider<List<NewsQueryModel>>((ref) async {
//   final bookmarkController = ref.watch(bookmarkControllerProvider.notifier);
//   return bookmarkController.fetchBookmarks();
// });

// class BookmarkController extends StateNotifier<List<NewsQueryModel>> {
//   final BookmarkRepository _repository;

//   BookmarkController({required BookmarkRepository repository})
//       : _repository = repository,
//         super([]) {
//     _init(); // Fetch bookmarks as soon as controller is initialized
//   }

//   Future<void> _init() async {
//     final bookmarks = await fetchBookmarks();
//     state = bookmarks;
//   }

//   Future<List<NewsQueryModel>> fetchBookmarks() async {
//     try {
//       final bookmarks = await _repository.fetchBookmarks();
//       state = bookmarks;
//       return bookmarks;
//     } catch (e) {
//       return [];
//     }
//   }

//   Future<void> toggleBookmark(NewsQueryModel news) async {
//     try {
//       final exists = state.any((item) => item.newsUrl == news.newsUrl);
//       if (exists) {
//         state = state.where((item) => item.newsUrl != news.newsUrl).toList();
//         print('removed: ${news.newsHead}');
//       } else {
//         state = [...state, news];
//         print('added: ${news.newsHead}');
//       }
//       print('Update state: ${state.length}');
//       await _repository.saveBookmarks(state);
//       print('Updated state: ${state.length}');
//     } catch (e) {
//       throw Exception('Error occurred during toggle: ${e.toString()}');
//     }
//   }
// }
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skimz/features/bookmark/repository/bookmark_repository.dart';
import 'package:skimz/models/news_query_model.dart';

final bookmarkControllerProvider =
    StateNotifierProvider<BookmarkController, List<NewsQueryModel>>((ref) {
  return BookmarkController(
    repository: ref.watch(bookmarkRepositoryProvider),
  );
});

class BookmarkController extends StateNotifier<List<NewsQueryModel>> {
  final BookmarkRepository _repository;

  BookmarkController({required BookmarkRepository repository})
      : _repository = repository,
        super([]) {
    _init(); // Fetch bookmarks on init
  }

  Future<void> _init() async {
    final bookmarks = await fetchBookmarks();
    state = bookmarks;
  }

  Future<List<NewsQueryModel>> fetchBookmarks() async {
    try {
      final bookmarks = await _repository.fetchBookmarks();
      state = bookmarks;
      return bookmarks;
    } catch (e) {
      return [];
    }
  }

  Future<void> toggleBookmark(NewsQueryModel news) async {
    try {
      final exists = state.any((item) => item.newsUrl == news.newsUrl);
      if (exists) {
        state = state.where((item) => item.newsUrl != news.newsUrl).toList();
        print('removed: ${news.newsHead}');
      } else {
        state = [...state, news];
        print('added: ${news.newsHead}');
      }
      print('Update state: ${state.length}');
      await _repository.saveBookmarks(state);
      print('Updated state: ${state.length}');
    } catch (e) {
      throw Exception('Error occurred during toggle: ${e.toString()}');
    }
  }
}
