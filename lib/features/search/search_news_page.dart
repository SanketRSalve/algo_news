import 'dart:async';
import 'package:algo_news/features/home/presentation/widgets/news_card.dart';
import 'package:algo_news/features/search/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNewsPage extends ConsumerStatefulWidget {
  const SearchNewsPage({super.key});

  @override
  ConsumerState<SearchNewsPage> createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends ConsumerState<SearchNewsPage> {
  final _searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchNewsProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBar(
                controller: _searchController,
                onChanged: (query) {
                  if (query.isNotEmpty) {
                    _debouncer.run(() {
                      ref.read(searchNewsProvider.notifier).searchNews(query);
                    });
                  }
                },
                leading: const Icon(Icons.search),
                trailing: [
                  if (_searchController.text.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        ref.invalidate(searchNewsProvider);
                      },
                    ),
                ],
                hintText: 'Search news...',
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
            Expanded(
              child: searchState.when(
                data: (news) {
                  if (_searchController.text.isEmpty) {
                    return _buildInitialState();
                  }

                  if (news.isEmpty) {
                    return _buildEmptyState();
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      final article = news[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: NewsCard(
                          title: article.title,
                          subhead: article.description,
                          description: article.content,
                          timeAgo: article.publishedAt,
                          imageUrl: article.urlToImage,
                          sourceUrl: article.url,
                          sourceName: article.source,
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, _) => Center(
                  child: Text('Error: $error'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Search for news',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Find articles about any topic',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No results found',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try different keywords',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
