import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/theme_controller.dart';
import '../../core/constants/app_colors.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeControllerProvider);

    return ListView(
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
    );
  }
}
