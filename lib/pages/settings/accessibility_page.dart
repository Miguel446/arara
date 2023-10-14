import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/theme.dart';
import '../../shared/providers/theme_mode_provider.dart';
import '../../widgets/logo_app_bar.dart';

class AccessibilityPage extends ConsumerWidget {
  const AccessibilityPage({super.key});

  static const path = '/acessibilidade';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: const LogoAppBar(),
      body: SingleChildScrollView(
        padding: AppTheme.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Acessibilidade', style: textTheme.headlineMedium),
            const SizedBox(height: 16),
            const Divider(),
            SwitchListTile.adaptive(
              title: const Text('Modo noturno'),
              value: themeMode == ThemeMode.dark,
              onChanged: (value) {
                ref.read(themeModeProvider.notifier).toggleThemeMode(value);
              },
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
