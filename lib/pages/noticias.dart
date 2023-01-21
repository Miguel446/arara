import 'package:flutter/material.dart';

import '../enums/color_enum.dart';
import '../ui/pages/article_tab_page.dart';
import '../ui/pages/news_tab_page.dart';

class TelaNoticias extends StatelessWidget {
  const TelaNoticias({super.key});

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
            children: <Widget>[
              // Logo
              Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 0),
                  child: const Image(
                    height: 80,
                    image: AssetImage('assets/icone.png'),
                  )),
              //TabBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
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
                                  color: ColorEnum.roxo,
                                  width: 3,
                                  style: BorderStyle.solid)),
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
                  children: <Widget>[
                    NewsTabPage(),
                    NewsTabPage(),
                    ArticleTabPage(),
                    NewsTabPage(),
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
