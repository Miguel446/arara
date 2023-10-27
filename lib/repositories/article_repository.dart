import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../mocks/mock_articles.dart';
import '../models/article.dart';

export '../models/article.dart';

final articleRepositoryProvider = Provider((ref) => ArticleRepository());

class ArticleRepository {
  Future<List<Article>> getArticles() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return mockArticles;
  }
}
