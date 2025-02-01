import 'package:algo_news/features/news/models/news_category.dart';
import 'package:algo_news/features/news/models/news_model.dart';

abstract class NewsRepository {
  Future<List<NewsModel>> getNewsByCategory(NewsCategory category);
}
