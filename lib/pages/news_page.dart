import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';
import '../widgets/tabs/article_card_tab.dart';
import '../widgets/tabs/news_card_tab.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (_, __) => [
            const SliverToBoxAdapter(
              child: AppLogo(
                padding: EdgeInsets.only(top: 10),
              ),
            ),
            SliverAppBar(
              pinned: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(-10),
                child: Container(),
              ),
              surfaceTintColor: Colors.transparent,
              flexibleSpace: const TabBar(
                padding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(text: 'Todas'),
                  Tab(text: 'Notícias'),
                  Tab(text: 'Artigos'),
                  Tab(text: 'Destaques'),
                ],
              ),
            )
          ],
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              NewsCardTab(),
              NewsCardTab(getHighlights: false),
              ArticleCardTab(),
              NewsCardTab(getHighlights: true),
            ],
          ),
        ),
      ),
    );
  }
}
