import 'package:algo_news/features/bookmarks/bookmark_controller.dart';
import 'package:algo_news/features/home/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedNewsPage extends ConsumerWidget {
  const SavedNewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedNewsState = ref.watch(bookmarkControllerProvider);
    final bookmarkController = ref.watch(bookmarkControllerProvider.notifier);

    return savedNewsState.when(
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
            return NewsCard(
              title: news.title,
              subhead: news.subhead,
              description: news.description,
              timeAgo: news.timeAgo,
              isBookmarked: true, // Always true since these are saved items
              onBookmark: () {
                bookmarkController.toggleBookmark(news);
              },
              onReadMore: () {
                // Handle read more tap
              },
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
    );
  }
}