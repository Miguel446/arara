import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';
import '../widgets/tabs/article_card_tab.dart';
import '../widgets/tabs/news_card_tab.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AppLogo(
                padding: EdgeInsets.only(top: 10),
              ),
              //TabBar
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
                  tabs: [
                    Tab(text: 'Todas'),
                    Tab(text: 'Notícias'),
                    Tab(text: 'Artigos'),
                    Tab(text: 'Destaques'),
                  ],
                ),
              ),
              //TabBarView
              SizedBox(
                height: 800,
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const NewsCardTab(),
                    const NewsCardTab(getHighlights: false),
                    ArticleCardTab(),
                    const NewsCardTab(getHighlights: true),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
