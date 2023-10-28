import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/theme.dart';
import '../../repositories/article_repository.dart';
import '../card/article_card.dart';

class ArticleCardTab extends ConsumerStatefulWidget {
  const ArticleCardTab({super.key});

  @override
  ConsumerState<ArticleCardTab> createState() => _ArticleCardTabState();
}

class _ArticleCardTabState extends ConsumerState<ArticleCardTab> {
  List<Article> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  void getArticles() async {
    setState(() => isLoading = true);

    try {
      articles = await ref.read(articleRepositoryProvider).getArticles();
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: UniqueKey(),
      padding: AppTheme.pagePadding,
      children: articles
          .map(
            (article) => ArticleCard(article),
          )
          .toList(),
    );
  }
}
