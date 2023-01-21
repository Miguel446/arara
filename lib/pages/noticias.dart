import 'package:flutter/material.dart';

import '../enums/color_enum.dart';
import '../ui/pages/news_tab_page.dart';

class TelaNoticias extends StatelessWidget {
  const TelaNoticias({super.key});

  Widget itemArtigo(String titulo, String fonte) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  titulo,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(fonte,
                    style: const TextStyle(fontSize: 12, color: Colors.grey))
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(
                Icons.chevron_right,
                color: Color(0xffa071a0),
                size: 30,
              )
            ],
          )
        ],
      ),
    );
  }

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
                height: 1200,
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    NewsTabPage(),
                    NewsTabPage(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: [
                        itemArtigo('Moda, aparência e status social',
                            '2018 | Brasil de Fato | Antônio Moura'),
                        itemArtigo(
                            'O brechó como estratégia para o estímulo de comportamentos sustentáveis',
                            '2020 | LUME | Daniela Neumann'),
                        itemArtigo(
                            'Marcas de moda sustentável: critérios de sustentabilidade e ferramentas de comunicação',
                            '2014 | Repositorium | Mariana Araújo'),
                        itemArtigo(
                            'Ser sustentável está na moda? O perfil do consumidor jovem carioca no mercado da moda sustentável',
                            '2020 | IJBMKT | Veranise Debeux'),
                        itemArtigo(
                            'A arte como ferramenta de criatividade no design de moda sustentavel',
                            '2011 | Repertorium | Célia Santos'),
                        itemArtigo('Brechó como prática sustentável de consumo',
                            '2020 | PKP | Agatha Necchi')
                      ]),
                    ),
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
