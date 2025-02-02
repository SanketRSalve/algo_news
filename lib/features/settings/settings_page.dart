import 'package:algo_news/core/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor.withAlpha(10),
        surfaceTintColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: const Text('Settings'),
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: AppColors.primaryColor,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (_) {
                ref.read(themeControllerProvider.notifier).toggleTheme();
              },
              activeColor: AppColors.primaryColor,
            ),
          ),
          // Add more settings items here
        ],
      ),
    );
  }
}
