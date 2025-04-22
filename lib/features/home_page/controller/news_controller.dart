import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skimz/features/home_page/repository/news_repository.dart';
import 'package:skimz/models/news_query_model.dart';

final newsControllerProvider =
    StateNotifierProvider<NewsController, bool>((ref) {
  final newsRepository = ref.watch(newsRepositoryProvider);
  return NewsController(
    newsRepository: newsRepository,
  );
});

final newsProvider = FutureProvider<List<NewsQueryModel>>((ref) async {
  final newsController = ref.watch(newsControllerProvider.notifier);
  return newsController.fetchLatestNews();
});

final carouselNewsProvider = FutureProvider<List<NewsQueryModel>>((ref) async {
  final newsController = ref.watch(newsControllerProvider.notifier);
  return newsController.fetchCarouselNews();
});



class NewsController extends StateNotifier<bool>{
  final NewsRepository _newsRepository;
  NewsController(
    {required NewsRepository newsRepository,}
  ) :
  _newsRepository = newsRepository,
  super(false);

  Future<List<NewsQueryModel>> fetchLatestNews() async {
    try {
      return await _newsRepository.fetchLatestNews();
    } catch (e) {
      return [];
    }
  }

  Future<List<NewsQueryModel>> fetchCarouselNews() async {
    try {
      return await _newsRepository.fetchCarouselNews();
    } catch (e) {
      return [];
    }
  }

}