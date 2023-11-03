import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/theme.dart';
import '../providers/news_provider.dart';
import '../widgets/card/news_card.dart';
import '../widgets/error_message.dart';
import '../widgets/logo_app_bar.dart';

class NewsDetailPage extends ConsumerWidget {
  final String newsId;

  const NewsDetailPage(this.newsId, {super.key});

  static const path = '/noticia/:id';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncNews = ref.watch(newsProvider(newsId));

    return Scaffold(
      appBar: const LogoAppBar(),
      body: asyncNews.when(
        data: (news) => ListView(
          padding: AppTheme.pagePadding,
          children: [
            NewsCard(news, isTappable: false),
            const SizedBox(height: 24),
            Text(
              news.content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => ErrorMessage(
          message: 'Erro ao carregar brechó',
          onRetry: () => ref.refresh(newsProvider(newsId)),
        ),
        skipLoadingOnRefresh: false,
      ),
    );
  }
}
