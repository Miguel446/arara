import 'package:flutter/material.dart';

import '../ui/pages/search_tab_page.dart';
import '../ui/widgets/home_header.dart';

class ShopsPage extends StatelessWidget {
  const ShopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return const [
            SliverToBoxAdapter(child: SafeArea(child: SizedBox())),
            HomeHeader(),
          ];
        },
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SearchTabPage(false),
            SearchTabPage(true),
          ],
        ),
      ),
    );
  }
}
