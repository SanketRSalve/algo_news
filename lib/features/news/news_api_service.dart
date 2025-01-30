import 'package:algo_news/features/news/news_category.dart';
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
      },
    );
    return response.data;
  }
}
