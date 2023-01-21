import 'package:flutter/material.dart';

import '../widgets/article_item_card.dart';

class ArticleTabPage extends StatelessWidget {
  ArticleTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: articles,
      ),
    );
  }

  final articles = <Widget>[
    const ArticleItemCard(
        titulo: 'Moda, aparência e status social',
        fonte: '2018 | Brasil de Fato | Antônio Moura'),
    const ArticleItemCard(
        titulo:
            'O brechó como estratégia para o estímulo de comportamentos sustentáveis',
        fonte: '2020 | LUME | Daniela Neumann'),
    const ArticleItemCard(
        titulo:
            'Marcas de moda sustentável: critérios de sustentabilidade e ferramentas de comunicação',
        fonte: '2014 | Repositorium | Mariana Araújo'),
    const ArticleItemCard(
        titulo:
            'Ser sustentável está na moda? O perfil do consumidor jovem carioca no mercado da moda sustentável',
        fonte: '2020 | IJBMKT | Veranise Debeux'),
    const ArticleItemCard(
        titulo:
            'A arte como ferramenta de criatividade no design de moda sustentavel',
        fonte: '2011 | Repertorium | Célia Santos'),
    const ArticleItemCard(
        titulo: 'Brechó como prática sustentável de consumo',
        fonte: '2020 | PKP | Agatha Necchi')
  ];
}
