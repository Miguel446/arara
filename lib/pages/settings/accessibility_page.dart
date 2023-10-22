import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/theme.dart';
import '../../providers/font_size_provider.dart';
import '../../providers/theme_mode_provider.dart';
import '../../widgets/logo_app_bar.dart';
import '../../widgets/scaled_icon.dart';

class AccessibilityPage extends ConsumerWidget {
  const AccessibilityPage({super.key});

  static const path = '/acessibilidade';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final themeMode = ref.watch(themeModeProvider);
    final fontSizeFactor = ref.watch(fontSizeFactorProvider);

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: ScaledIcon(Icons.format_size),
                ),
                Expanded(
                  child: Text(
                    'Tamanho da fonte',
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'A',
                  style: TextStyle(color: AppTheme.primary, fontSize: 12),
                ),
                Expanded(
                  child: Slider.adaptive(
                    min: 1,
                    max: 2,
                    value: fontSizeFactor,
                    divisions: 7,
                    onChanged: (value) => ref
                        .read(fontSizeFactorProvider.notifier)
                        .fontSizeFactor = value,
                  ),
                ),
                const Text(
                  'A',
                  style: TextStyle(color: AppTheme.primary, fontSize: 20),
                ),
              ],
            ),
            SwitchListTile.adaptive(
              title: Text('Modo noturno', style: textTheme.bodyLarge),
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
