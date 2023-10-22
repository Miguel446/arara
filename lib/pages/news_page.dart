import 'package:flutter/material.dart';

import '../config/theme.dart';
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          transform: Matrix4.translationValues(0.0, 38.45, 0.0),
                          child: const Divider(
                            thickness: 1.2,
                            color: Colors.grey,
                          ),
                        ),
                        const TabBar(
                          labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                          labelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: UnderlineTabIndicator(
                            insets: EdgeInsets.symmetric(horizontal: 30),
                            borderSide: BorderSide(
                              color: AppTheme.primary,
                              width: 3,
                              style: BorderStyle.solid,
                            ),
                          ),
                          tabs: [
                            Tab(
                              text: 'Todas',
                            ),
                            Tab(
                              text: 'Notícias',
                            ),
                            Tab(
                              text: 'Artigos',
                            ),
                            Tab(
                              text: 'Destaques',
                            ),
                          ],
                        )
                      ],
                    )
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
