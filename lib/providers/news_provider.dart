import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/news_repository.dart';

export '../models/news.dart';

final newsProvider =
    FutureProvider.autoDispose.family<News, String>((ref, newsId) {
  return ref.watch(newsRepositoryProvider).getNewsById(newsId);
});
