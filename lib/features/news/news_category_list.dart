import 'package:algo_news/features/news/news_category.dart';
import 'package:algo_news/features/news/news_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(newsCategoriesProvider);

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: NewsCategory.values.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10.0),
        itemBuilder: (context, index) {
          final category = NewsCategory.values[index];
          final isSelected = selectedCategory == index;

          return FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: isSelected ? Colors.blueAccent : Colors.white,
            ),
            onPressed: () {
              ref.read(newsCategoriesProvider.notifier).setCategory(category);
            },
            child: Text(
              category.name,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
