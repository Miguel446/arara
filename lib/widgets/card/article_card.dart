import 'package:flutter/material.dart';

import '../../config/theme.dart';
import '../../models/article.dart';
import '../scaled_icon.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    final Article(:title, :year, :source, :author) = article;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  [year, source, author].join(' | '),
                  style: textTheme.bodySmall?.copyWith(color: Colors.grey),
                )
              ],
            ),
          ),
          const ScaledIcon(
            Icons.chevron_right,
            size: 30,
            color: AppTheme.primary,
          )
        ],
      ),
    );
  }
}
