import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/news.dart';
import '../../pages/news_detail_page.dart';
import '../../utils/extensions.dart';

class NewsCard extends StatelessWidget {
  final News news;
  final bool isTappable;

  const NewsCard(this.news, {super.key, this.isTappable = true});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );

    return InkWell(
      onTap: isTappable
          ? () => context.push(NewsDetailPage.path.withId(news.id))
          : null,
      child: Container(
        constraints: const BoxConstraints(minHeight: 200),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: news.imageUrl != null
              ? DecorationImage(
                  fit: BoxFit.fill,
                  image: (news.imageUrl!.isUrl
                          ? NetworkImage(news.imageUrl!)
                          : AssetImage('assets/${news.imageUrl!}'))
                      as ImageProvider<Object>,
                )
              : null,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.0),
            gradient: const LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black87,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.title,
                style: textTheme.labelMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Text(
                '${news.createdAt.toDateString()} | ${news.createdAt.toTimeString()} | ${news.source}',
                style: textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
