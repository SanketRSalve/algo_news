
import 'package:algo_news/features/bookmarks/controllers/bookmark_controller.dart';
import 'package:algo_news/features/bookmarks/models/saved_news.dart';
import 'package:algo_news/features/home/presentation/widgets/news_card.dart';
import 'package:algo_news/features/news/controllers/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsList extends ConsumerWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsControllerProvider);
    final bookmarksState = ref.watch(bookmarkControllerProvider);

    return newsState.when(
      data: (newsList) {
        if (newsList.isEmpty) {
          return const Center(child: Text("No news available"));
        }

        return ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            final news = newsList[index];

            // Check if this news is bookmarked
            final isBookmarked = bookmarksState.whenOrNull(
                  data: (savedNews) =>
                      savedNews.any((saved) => saved.title == news.title),
                ) ??
                false;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: NewsCard(
                title: news.title,
                subhead: news.description,
                description: news.content,
                imageUrl: news.urlToImage,
                timeAgo: news.publishedAt,
                sourceUrl: news.url,
                sourceName: news.source,
                onReadMore: () {
                  print("Read more tapped for ${news.title}!");
                },
                onBookmark: () {
                  ref.read(bookmarkControllerProvider.notifier).toggleBookmark(
                        SavedNews(
                          title: news.title,
                          subhead: news.description,
                          description: news.content,
                          timeAgo: news.publishedAt,
                          imageUrl: news.urlToImage,
                          sourceUrl: news.url,
                          sourceName: news.source,
                        ),
                      );
                },
                isBookmarked: isBookmarked,
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text("Error: $error")),
    );
  }
}
