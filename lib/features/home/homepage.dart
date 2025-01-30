import 'package:algo_news/features/home/news_card.dart';
import 'package:algo_news/features/news/news_category_list.dart';
import 'package:algo_news/features/news/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [CategoryList(), Expanded(child: NewsList())],
      ),
    );
  }
}

class NewsList extends ConsumerWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsControllerProvider);

    return newsState.when(
      data: (newsList) {
        if (newsList.isEmpty) {
          return const Center(child: Text("No news available"));
        }

        return ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            final news = newsList[index];

            return NewsCard(
              title: news.title,
              subhead: news.description,
              description: news.content,
              timeAgo: news.publishedAt,
              onReadMore: () {
                print("Read more tapped for ${news.title}!");
              },
              onBookmark: () {
                print("Bookmark toggled for ${news.title}!");
              },
              isBookmarked: false,
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text("Error: $error")),
    );
  }
}
