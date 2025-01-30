import 'package:algo_news/core/navigation/providers/dio_provider.dart';
import 'package:algo_news/features/news/news_api_service.dart';
import 'package:algo_news/features/news/news_repository.dart';
import 'package:algo_news/features/news/news_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_providers.g.dart';

@riverpod
NewsApiService newsApiService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return NewsApiService(dio);
}

@riverpod
NewsRepository newsRepository(Ref ref) {
  final newsApiService = ref.watch(newsApiServiceProvider);
  return NewsRepositoryImpl(newsApiService);
}
