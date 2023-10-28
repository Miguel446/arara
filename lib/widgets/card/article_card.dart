import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/theme.dart';
import '../../models/article.dart';
import '../dialogs/dialog.dart';
import '../scaled_icon.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    final Article(:title, :year, :source, :author, :url) = article;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () async {
        final errorDialog = AppDialog.simple(
          context: context,
          title: 'Erro',
          text: 'Não foi possível abrir o link do artigo',
          onButtonPressed: context.pop,
        );

        final uri = Uri.parse(url);

        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          errorDialog.show();
        }
      },
      child: Container(
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
      ),
    );
  }
}
