import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/providers/shop_search_name_provider.dart';
import '../config/theme.dart';
import 'app_logo.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      pinned: false,
      collapsedHeight: 217.0,
      backgroundColor: Colors.transparent,
      flexibleSpace: SafeArea(
        child: Column(
          children: [
            const AppLogo(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Procure por bazares e brechós',
                ),
                onChanged: (value) =>
                    ref.read(shopSearchNameProvider.notifier).state = value,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  Container(
                    transform: Matrix4.translationValues(0, 38.45, 0),
                    child: const Divider(
                      thickness: 1.2,
                      color: Colors.grey,
                    ),
                  ),
                  TabBar(
                    labelColor: Theme.of(context).textTheme.bodyMedium?.color,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: const UnderlineTabIndicator(
                      insets: EdgeInsets.symmetric(horizontal: 70),
                      borderSide: BorderSide(
                        color: AppTheme.primary,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                    ),
                    tabs: const [
                      Tab(text: 'Espaços físicos'),
                      Tab(text: 'Espaços virtuais'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
