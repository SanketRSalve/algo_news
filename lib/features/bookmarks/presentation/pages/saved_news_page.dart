import 'package:algo_news/core/constants/app_colors.dart';
import 'package:algo_news/features/bookmarks/controllers/bookmark_controller.dart';
import 'package:algo_news/features/home/presentation/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedNewsPage extends ConsumerWidget {
  const SavedNewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedNewsState = ref.watch(bookmarkControllerProvider);
    final bookmarkController = ref.watch(bookmarkControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor.withAlpha(10),
        surfaceTintColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: const Text('Saved'),
        ),
        centerTitle: false,
      ),
      body: savedNewsState.when(
        data: (savedNews) {
          if (savedNews.isEmpty) {
            return const Center(
              child: Text(
                "No saved news yet",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: savedNews.length,
            itemBuilder: (context, index) {
              final news = savedNews[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NewsCard(
                  title: news.title,
                  subhead: news.subhead,
                  description: news.description,
                  imageUrl: news.imageUrl,
                  timeAgo: news.timeAgo,
                  sourceName: news.sourceName,
                  sourceUrl: news.sourceUrl,
                  isBookmarked: true, // Always true since these are saved items
                  onBookmark: () {
                    bookmarkController.toggleBookmark(news);
                  },
                  onReadMore: () {
                    // Handle read more tap
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text(
            "Error loading saved news: $error",
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
