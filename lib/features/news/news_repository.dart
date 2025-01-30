import 'package:algo_news/features/news/news_category.dart';
import 'package:algo_news/features/news/news_model.dart';

abstract class NewsRepository {
  Future<List<NewsModel>> getNewsByCategory(NewsCategory category);
}
