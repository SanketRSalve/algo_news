import 'package:algo_news/features/news/news_category.dart';
import 'package:algo_news/features/news/news_model.dart';
import 'package:algo_news/features/news/news_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_controller.g.dart';

@riverpod
class NewsController extends _$NewsController {
  @override
  FutureOr<List<NewsModel>> build() {
    return [];
  }

  Future<void> fetchNewByCategory(NewsCategory category) async {
    try {
      final newsRepository = ref.read(newsRepositoryProvider);
      final news = await newsRepository.getNewsByCategory(category);
      state = AsyncData(news);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
