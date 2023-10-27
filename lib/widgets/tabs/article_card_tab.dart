import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/article_repository.dart';
import '../article_item_card.dart';

class ArticleCardTab extends ConsumerStatefulWidget {
  const ArticleCardTab({super.key});

  @override
  ConsumerState<ArticleCardTab> createState() => _ArticleCardTabState();
}

class _ArticleCardTabState extends ConsumerState<ArticleCardTab> {
  List<Article> _articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  void getArticles() async {
    setState(() => isLoading = true);

    try {
      _articles = await ref.read(articleRepositoryProvider).getArticles();
    } finally {
      setState(() => isLoading = false);
    }
  }

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
