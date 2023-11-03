import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/theme.dart';
import 'app_logo.dart';
import 'shop_search_input.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SliverToBoxAdapter(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              AppLogo(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              ShopSearchInput(),
              SizedBox(height: 10),
              TabBar(
                indicator: UnderlineTabIndicator(
                  insets: EdgeInsets.fromLTRB(70, 0, 70, -1.5),
                  borderSide: BorderSide(
                    color: AppTheme.primary,
                    width: 3,
                  ),
                ),
                tabs: [
                  Tab(text: 'Espaços físicos'),
                  Tab(text: 'Espaços virtuais'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
