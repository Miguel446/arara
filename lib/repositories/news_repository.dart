import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../mocks/mock_news.dart';
import '../models/news.dart';
export '../models/news.dart';

final newsRepositoryProvider = Provider((ref) => NewsRepository());

class NewsRepository {
  Future<List<News>> getNews({bool? getHighlights}) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (getHighlights != null) {
      return mockNews
          .where((news) => news.isHighlight == getHighlights)
          .toList();
    }

    return mockNews;
  }

  Future<News> getNewsById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));

    return mockNews.firstWhere((news) => news.id == id);
  }
}
