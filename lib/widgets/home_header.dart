import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/theme.dart';
import 'app_logo.dart';
import 'shop_search_input.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const AppLogo(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              const ShopSearchInput(),
              const SizedBox(height: 10),
              Stack(
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
            ],
          ),
        ),
      ),
    );
  }
}
