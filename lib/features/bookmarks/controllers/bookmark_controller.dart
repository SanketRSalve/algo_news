import 'dart:async';
import 'package:algo_news/features/bookmarks/providers/bookmarks_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/saved_news.dart';

part 'bookmark_controller.g.dart';

@riverpod
class BookmarkController extends _$BookmarkController {
  @override
  FutureOr<List<SavedNews>> build() async {
    return _loadSavedNews();
  }

  Future<List<SavedNews>> _loadSavedNews() async {
    try {
      final repository = await ref.read(bookmarkRepositoryProvider.future);
      return await repository.getAllSavedNews();
    } catch (error) {
      throw Exception('Failed to load saved news: $error');
    }
  }

  Future<void> toggleBookmark(SavedNews news) async {
    try {
      final repository = await ref.read(bookmarkRepositoryProvider.future);
      final isSaved = await repository.isNewsSaved(news.title);
      if (isSaved) {
        await repository.removeNews(news.title);
      } else {
        await repository.saveNews(news);
      }
      state = await AsyncValue.guard(() => _loadSavedNews());
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }
}
