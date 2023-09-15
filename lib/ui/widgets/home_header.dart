import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enums/color_enum.dart';
import '../../shared/providers/shop_search_name_provider.dart';

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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Image(
                height: 80,
                image: AssetImage('assets/icone.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  suffixIcon: const Icon(Icons.search),
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
                  const TabBar(
                    labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: UnderlineTabIndicator(
                      insets: EdgeInsets.symmetric(horizontal: 70),
                      borderSide: BorderSide(
                        color: ColorEnum.roxo,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                    ),
                    tabs: [
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
