import 'package:algo_news/features/news/models/news_category.dart';
import 'package:dio/dio.dart';

class NewsApiService {
  final Dio _dio;
  final String _baseUrl = 'https://newsapi.org/v2';
  final String _apiKey = '7a439f704a174180b86fe078c88be465';

  NewsApiService(this._dio);

  // Fetch News by Category
  Future<Map<String, dynamic>> getNewsByCategory(NewsCategory category) async {
    final response = await _dio.get(
      '$_baseUrl/top-headlines',
      queryParameters: {
        'category': category.name,
        'apiKey': _apiKey,
        'country': 'us',
        'page': 1,
        'pageSize': 10,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> searchNews(String query) async {
    final response = await _dio.get(
      '$_baseUrl/everything',
      queryParameters: {
        'q': query,
        'apiKey': _apiKey,
        'pageSize': 15,
        'sortBy': 'relevancy',
        'language': 'en',
      },
    );
    return response.data;
  }
}
