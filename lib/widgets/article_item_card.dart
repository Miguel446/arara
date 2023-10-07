import 'package:flutter/material.dart';

class ArticleItemCard extends StatelessWidget {
  final String titulo;
  final String fonte;

  const ArticleItemCard({super.key, required this.titulo, required this.fonte});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  titulo,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(fonte,
                    style: const TextStyle(fontSize: 12, color: Colors.grey))
              ],
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chevron_right,
                size: 30,
              )
            ],
          )
        ],
      ),
    );
  }
}
