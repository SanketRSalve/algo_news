import 'package:algo_news/features/bookmarks/saved_news.dart';
import 'package:algo_news/features/home/news_card.dart';
import 'package:algo_news/features/news/news_category_list.dart';
import 'package:algo_news/features/news/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bookmarks/bookmark_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: const Text('AlgoNews'),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CategoryList(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [Expanded(child: NewsList())],
        ),
      ),
    );
  }
}

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
