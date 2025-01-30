import 'package:algo_news/core/constants/app_colors.dart';
import 'package:algo_news/core/navigation/bottom_navigation_provider.dart';
import 'package:algo_news/features/home/homepage.dart';
import 'package:algo_news/features/saved/saved_news_page.dart';
import 'package:algo_news/features/search/search_news_page.dart';
import 'package:algo_news/features/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeControllerProvider);

    return MaterialApp(
      title: 'News App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
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
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        shadowColor: Colors.grey[100]!.withAlpha(100),
        title: Text(
          "AlgoNews",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(bottomNavigationControllerProvider.notifier).setIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              height: 24,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/home-solid.svg',
              height: 24,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              height: 24,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/search.svg',
              height: 24,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bookmark.svg',
              height: 24,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/bookmark-solid.svg',
              height: 24,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/setting.svg',
              height: 24,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/setting-solid.svg',
              height: 24,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
