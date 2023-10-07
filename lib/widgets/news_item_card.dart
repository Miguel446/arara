import 'package:flutter/material.dart';

class NewsItemCard extends StatelessWidget {
  final String imagem;
  final String titulo;
  final String info;

  const NewsItemCard(
      {super.key,
      required this.imagem,
      required this.titulo,
      required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Stack(alignment: Alignment.center, children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/$imagem',
                  ),
                ),
              ),
              height: 200,
            )),
        Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xff63924F).withOpacity(0.3),
                    const Color(0xff63924F).withOpacity(0.7),
                    const Color(0xff63924F).withOpacity(0.7),
                  ],
                  stops: const [
                    0.0,
                    0.4,
                    0.5,
                    1.0
                  ])),
        ),
        SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 20, top: 95),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, top: 10),
                        child: Text(
                          titulo,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Text(
                      info,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
