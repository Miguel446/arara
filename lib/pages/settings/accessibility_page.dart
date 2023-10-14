import 'package:flutter/material.dart';

import '../../config/theme.dart';
import '../../widgets/logo_app_bar.dart';

class AccessibilityPage extends StatelessWidget {
  const AccessibilityPage({super.key});

  static const path = '/acessibilidade';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
              value: false,
              onChanged: (_) {},
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
