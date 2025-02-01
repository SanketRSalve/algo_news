import 'package:algo_news/core/constants/app_colors.dart';
import 'package:algo_news/features/home/presentation/widgets/news_list.dart';
import 'package:algo_news/features/home/presentation/widgets/news_category_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor.withAlpha(10),
        surfaceTintColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
          child: const Text('AlgoNews'),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
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
