import 'package:arara/enums/color_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class TelaAvaliacoes extends StatelessWidget {
  const TelaAvaliacoes({super.key});

  Widget itemAvaliacao(List<String> listaImagens, String nome) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: ImageSlideshow(
              height: 200,
              indicatorRadius: 4,
              indicatorBackgroundColor: Colors.white70,
              indicatorColor: ColorEnum.verde,
              autoPlayInterval: 0,
              children: <Widget>[
                Image.asset(
                  listaImagens[0],
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  listaImagens[1],
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  listaImagens[2],
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 20.0),
            child: Text(
              nome,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: const <Widget>[
                Icon(
                  Icons.star,
                  color: ColorEnum.verde,
                  size: 17,
                ),
                Icon(
                  Icons.star,
                  color: ColorEnum.verde,
                  size: 17,
                ),
                Icon(
                  Icons.star,
                  color: ColorEnum.verde,
                  size: 17,
                ),
                Icon(
                  Icons.star,
                  color: ColorEnum.verde,
                  size: 17,
                ),
                Icon(
                  Icons.star,
                  color: ColorEnum.verde,
                  size: 17,
                ),
                Text(
                  ' 1 dia atrás',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                        text:
                            "“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua....” ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Ler mais',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                decoration: TextDecoration.underline,
                              ))
                        ]),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: const <Widget>[
                Text(
                  'Luciana Valadares',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemVerMais() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Ver mais',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black87,
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(20),
                    child: const Image(
                      image: AssetImage('assets/logo.png'),
                    )),
                Row(
                  children: const [
                    Text('Avaliações',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.left),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                itemAvaliacao([
                  'assets/brecho3.png',
                  'assets/brecho32.jpeg',
                  'assets/brecho33.jpeg'
                ], 'Brechó Stylus'),
                itemAvaliacao([
                  'assets/brecho2.png',
                  'assets/brecho22.jpeg',
                  'assets/brecho23.jpeg'
                ], 'Brechó de Elite'),
                itemVerMais(),
                const SizedBox(height: 100)
              ],
            ),
          ),
        ));
  }
}
