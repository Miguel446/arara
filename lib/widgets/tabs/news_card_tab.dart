import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/theme.dart';
import '../../repositories/news_repository.dart';
import '../card/news_card.dart';
import '../loading/lazy_list_view.dart';
import '../loading/skeleton.dart';

class NewsCardTab extends ConsumerStatefulWidget {
  const NewsCardTab({
    super.key,
    this.getHighlights,
  });

  final bool? getHighlights;

  @override
  ConsumerState<NewsCardTab> createState() => _NewsCardTabState();
}

class _NewsCardTabState extends ConsumerState<NewsCardTab> {
  List<News> news = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  void getNews() async {
    setState(() => isLoading = true);

    try {
      news = await ref.read(newsRepositoryProvider).getNews(
            getHighlights: widget.getHighlights,
          );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LazyListView(
      isLoading: isLoading,
      skeleton: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Skeleton(
          height: 200,
          width: double.infinity,
          borderRadius: AppTheme.borderRadius,
        ),
      ),
      items: news,
      itemBuilder: (news) => NewsCard(news),
    );
  }
}
