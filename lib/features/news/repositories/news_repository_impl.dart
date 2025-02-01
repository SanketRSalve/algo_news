import 'package:algo_news/features/news/services/news_api_service.dart';
import 'package:algo_news/features/news/models/news_category.dart';
import 'package:algo_news/features/news/models/news_model.dart';
import 'package:algo_news/features/news/repositories/news_repository.dart';

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

  @override
  Future<List<NewsModel>> searchNews(String query) async {
    try {
      final response = await _newsApiService.searchNews(query);
      return (response['articles'] as List)
          .map((article) => NewsModel.fromJson(article))
          .toList();
    } catch (e) {
      throw Exception('Failed to search news: $e');
    }
  }
}
