import 'package:algo_news/features/news/news_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_category_provider.g.dart';

@riverpod
class NewsCategories extends _$NewsCategories {
  @override
  NewsCategory build() {
    return NewsCategory.business;
  }

  void setCategory(NewsCategory category) {
    state = category;
  }
}
