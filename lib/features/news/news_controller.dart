import 'package:algo_news/features/news/news_category.dart';
import 'package:algo_news/features/news/news_category_provider.dart';
import 'package:algo_news/features/news/news_model.dart';
import 'package:algo_news/features/news/news_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_controller.g.dart';

@riverpod
class NewsController extends _$NewsController {
  @override
  FutureOr<List<NewsModel>> build() async {
    final selectedCategory = ref.watch(newsCategoriesProvider);
    return await fetchNewByCategory(selectedCategory);
  }

  Future<List<NewsModel>> fetchNewByCategory(NewsCategory category) async {
    try {
      final newsRepository = ref.read(newsRepositoryProvider);
      final news = await newsRepository.getNewsByCategory(category);
      state = AsyncData(news);
      return news;
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
      return [];
    }
  }
}
