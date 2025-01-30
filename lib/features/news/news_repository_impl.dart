import 'package:algo_news/features/news/news_api_service.dart';
import 'package:algo_news/features/news/news_category.dart';
import 'package:algo_news/features/news/news_model.dart';
import 'package:algo_news/features/news/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService _newsApiService;

  NewsRepositoryImpl(this._newsApiService);
  @override
  Future<List<NewsModel>> getNewsByCategory(NewsCategory category) async {
    try {
      final response = await _newsApiService.getNewsByCategory(category);
      return (response['articles'] as List)
          .map((article) => NewsModel.fromJson(article))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch news by category: $e');
    }
  }
}
