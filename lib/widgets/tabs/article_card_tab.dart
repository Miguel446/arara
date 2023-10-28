import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/theme.dart';
import '../../repositories/article_repository.dart';
import '../card/article_card.dart';
import '../loading/skeleton.dart';

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
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isLoading
          ? ListView(
              key: UniqueKey(),
              padding: AppTheme.pagePadding,
              children: List.filled(
                6,
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Skeleton(
                    height: 70,
                    width: double.infinity,
                    borderRadius: AppTheme.borderRadius,
                  ),
                ),
              ),
            )
          : ListView(
              key: UniqueKey(),
              padding: AppTheme.pagePadding,
              children: articles
                  .map(
                    (article) => ArticleCard(article),
                  )
                  .toList(),
            ),
    );
  }
}
