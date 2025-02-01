import 'package:algo_news/features/news/models/news_model.dart';
import 'package:algo_news/features/news/providers/news_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart';

@riverpod
class SearchNews extends _$SearchNews {
  bool _isLoading = false;

  @override
  FutureOr<List<NewsModel>> build() async {
    return [];
  }

  Future<void> searchNews(String query) async {
    if (query.isEmpty || _isLoading) return;

    _isLoading = true;
    state = const AsyncValue.loading();

    try {
      final newsRepository = ref.read(newsRepositoryProvider);
      final searchResults = await newsRepository.searchNews(query);
      state = AsyncValue.data(searchResults);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    } finally {
      _isLoading = false;
    }
  }
} 