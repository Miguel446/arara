import 'package:flutter/material.dart';

import '../widgets/news_item_card.dart';
import '../widgets/see_more_item.dart';

class NewsTabPage extends StatelessWidget {
  NewsTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: news),
    );
  }

  final List<Widget> news = [
    const NewsItemCard(
      imagem: 'noticia1.png',
      titulo:
          'Sebrae no Pará incentiva a moda sustentável: pneus e câmaras são usados na produção de acessórios',
      info: '04/01/2023 | 14:32 | Sebrae',
    ),
    const NewsItemCard(
      imagem: 'noticia2.png',
      titulo:
          'Paraenses ganham o mundo da moda sustentável nacional e internacional',
      info: '30/12/2022 | 16:05 | O Liberal',
    ),
    const NewsItemCard(
      imagem: 'noticia3.png',
      titulo: 'Onde comprar roupa barata em Belém?',
      info: '04/01/2023 | 14:32 | Sebrae',
    ),
    const SeeMoreItem()
  ];
}
