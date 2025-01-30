import 'package:algo_news/features/bookmarks/bookmark_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmark_repository_provider.g.dart';

@riverpod
Future<BookmarkRepository> bookmarkRepository(Ref ref) async {
  return await BookmarkRepository.create();
}
