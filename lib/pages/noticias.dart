import 'package:arara/enums/color_enum.dart';
import 'package:flutter/material.dart';

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

  Widget itemNoticia(String imagem, String titulo, String info) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Stack(alignment: Alignment.center, children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/$imagem',
                  ),
                ),
              ),
              height: 200,
            )),
        Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xff63924F).withOpacity(0.3),
                    const Color(0xff63924F).withOpacity(0.7),
                    const Color(0xff63924F).withOpacity(0.7),
                  ],
                  stops: const [
                    0.0,
                    0.4,
                    0.5,
                    1.0
                  ])),
        ),
        SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 20, top: 95),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, top: 10),
                        child: Text(
                          titulo,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Text(
                      info,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget itemVerMais() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Ver mais',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black87,
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double safeHeight = height - padding.top - padding.bottom;
    print(safeHeight);

    if (safeHeight <= 600) {
      safeHeight = safeHeight * 1.4;
    }

    if (safeHeight > 600 && safeHeight <= 750) {
      safeHeight = safeHeight * 1.2;
    }

    if (safeHeight > 750) {
      safeHeight = safeHeight * 1.1;
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 0),
                  child: const Image(
                    height: 80,
                    image: AssetImage('assets/icone.png'),
                  )),
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
              SizedBox(
                height: safeHeight,
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: [
                        itemNoticia(
                            "noticia1.png",
                            "Sebrae no Pará incentiva a moda sustentável: pneus e câmaras são usados na produção de acessórios",
                            "04/01/2023 | 14:32 | Sebrae"),
                        itemNoticia(
                            "noticia2.png",
                            "Paraenses ganham o mundo da moda sustentável nacional e internacional",
                            "30/12/2022 | 16:05 | O Liberal"),
                        itemNoticia(
                            "noticia3.png",
                            "Onde comprar roupa barata em Belém?",
                            "04/01/2023 | 14:32 | Sebrae"),
                        itemVerMais()
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: [
                        itemNoticia(
                            "noticia1.png",
                            "Sebrae no Pará incentiva a moda sustentável: pneus e câmaras são usados na produção de acessórios",
                            "04/01/2023 | 14:32 | Sebrae"),
                        itemNoticia(
                            "noticia2.png",
                            "Paraenses ganham o mundo da moda sustentável nacional e internacional",
                            "30/12/2022 | 16:05 | O Liberal"),
                        itemNoticia(
                            "noticia3.png",
                            "Onde comprar roupa barata em Belém?",
                            "04/01/2023 | 14:32 | Sebrae"),
                        itemVerMais()
                      ]),
                    ),
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
                            '2020 | PKP | Agatha Necchi'),
                        itemArtigo(
                            'Projeto sustentável coloca o Pará na Semana de Moda de Milão',
                            '2022 | Rede Pará | Adna Figueira'),
                        itemArtigo(
                            'Moda com práticas sustentáveis estão em alta',
                            '2022 | O Liberal | Bruna Dias'),
                        itemArtigo(
                            'A moda sustentável do Amazônia Fashion Week',
                            '2022 | Steal The Look | Milena Otta')
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: [
                        itemNoticia(
                            "noticia1.png",
                            "Sebrae no Pará incentiva a moda sustentável: pneus e câmaras são usados na produção de acessórios",
                            "04/01/2023 | 14:32 | Sebrae"),
                        itemNoticia(
                            "noticia2.png",
                            "Paraenses ganham o mundo da moda sustentável nacional e internacional",
                            "30/12/2022 | 16:05 | O Liberal"),
                        itemNoticia(
                            "noticia3.png",
                            "Onde comprar roupa barata em Belém?",
                            "04/01/2023 | 14:32 | Sebrae"),
                        itemVerMais()
                      ]),
                    )
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
