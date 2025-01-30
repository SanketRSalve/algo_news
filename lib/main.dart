import 'package:algo_news/core/navigation/bottom_navigation_provider.dart';
import 'package:algo_news/features/home/homepage.dart';
import 'package:algo_news/features/saved/saved_news_page.dart';
import 'package:algo_news/features/search/search_news_page.dart';
import 'package:algo_news/features/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavigationControllerProvider);

    final screens = [
      const HomePage(),
      const SearchNewsPage(),
      const SavedNewsPage(),
      const SettingsPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("AlgoNews"),
      ),
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(bottomNavigationControllerProvider.notifier).setIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
