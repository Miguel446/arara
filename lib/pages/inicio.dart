import 'package:arara/enums/color_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TelaInicio extends StatelessWidget {
  const TelaInicio({super.key});

  Widget cardBazarVirtual(List<String> listaImagens, String nome, String nota,
      String instagram, String telefone, String formaPagamento) {
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
            margin: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        nome,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const <Widget>[
                    Icon(
                      Icons.star,
                      color: ColorEnum.verde,
                      size: 17,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      ' $nota',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[
                const Icon(
                  MdiIcons.instagram,
                  size: 14,
                  color: Colors.grey,
                ),
                Text(
                  ' $instagram',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[
                Text(
                  telefone,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[
                Text(
                  formaPagamento,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardBazarFisico(List<String> listaImagens, String nome, String nota,
      String endereco, String horario, String telefone) {
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
            margin: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        nome,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const <Widget>[
                    Icon(
                      Icons.star,
                      color: ColorEnum.verde,
                      size: 17,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      ' $nota',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[
                Text(
                  endereco,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[
                Text(
                  horario,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[
                Text(
                  telefone,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double safeHeight = height - padding.top - padding.bottom;
    print(safeHeight);

    if (safeHeight <= 600) {
      safeHeight = safeHeight * 1.8;
    }

    if (safeHeight > 600 && safeHeight <= 650) {
      safeHeight = safeHeight * 1.6;
    }

    if (safeHeight > 650 && safeHeight <= 700) {
      safeHeight = safeHeight * 1.5;
    }

    if (safeHeight > 700 && safeHeight <= 750) {
      safeHeight = safeHeight * 1.2;
    }

    if (safeHeight > 750) {
      safeHeight = safeHeight * 1.5;
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(20),
                  child: const Image(
                    image: AssetImage('assets/logo.png'),
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(24),
                          right: Radius.circular(24))),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_alt),
                  hintText: 'Procure por bazares e brechós',
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          transform: Matrix4.translationValues(0.0, 38.45, 0.0),
                          child: const Divider(
                            thickness: 1.2,
                            color: Colors.grey,
                          ),
                        ),
                        const TabBar(
                          labelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: UnderlineTabIndicator(
                              insets: EdgeInsets.symmetric(horizontal: 70),
                              borderSide: BorderSide(
                                  color: ColorEnum.roxo,
                                  width: 3,
                                  style: BorderStyle.solid)),
                          tabs: [
                            Tab(
                              text: 'Espaços físicos',
                            ),
                            Tab(
                              text: 'Espaços virtuais',
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: safeHeight,
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        cardBazarFisico([
                          'assets/brecho.png',
                          'assets/brecho12.jpeg',
                          'assets/brecho13.jpeg'
                        ],
                            'Pinguinho Brechó Space',
                            '4,98',
                            'Rua Domingos Marreiros, 727 - Umarizal',
                            'Seg. a Sex. - 08:00 às 18:00',
                            '-'),
                        cardBazarFisico([
                          'assets/brecho2.png',
                          'assets/brecho22.jpeg',
                          'assets/brecho23.jpeg'
                        ],
                            'Brechó de Elite',
                            '4,98',
                            'Tv. 14 de Março, 1304 - Umarizal',
                            'Seg. a Sab. - 09:00 às 18:00',
                            '(91) 98337-5857'),
                        cardBazarFisico([
                          'assets/brecho3.png',
                          'assets/brecho32.jpeg',
                          'assets/brecho33.jpeg'
                        ],
                            'Brechó Stylus',
                            '4,98',
                            'Tv. Padre Eutíquio, 218 - Campina',
                            'Seg. a Sab. - 08:00 às 18:00',
                            '(91) 3212-0413'),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        cardBazarVirtual([
                          'assets/brecho.png',
                          'assets/brecho12.jpeg',
                          'assets/brecho13.jpeg'
                        ],
                            'Pinguinho Brechó Space',
                            '4,98',
                            '@brecho_pinguinho',
                            '(91) 98337-5857',
                            'Formas de pagamento: pix, débito e crédito'),
                        cardBazarVirtual([
                          'assets/brecho2.png',
                          'assets/brecho22.jpeg',
                          'assets/brecho23.jpeg'
                        ],
                            'Brechó de Elite',
                            '4,98',
                            '@brecho_elite',
                            '(91) 98337-5857',
                            'Formas de pagamento: pix e dinheiro'),
                        cardBazarVirtual([
                          'assets/brecho3.png',
                          'assets/brecho32.jpeg',
                          'assets/brecho33.jpeg'
                        ],
                            'Brechó Stylus',
                            '4,98',
                            '@stylus_brecho',
                            '(91) 3212-0413',
                            'Formas de pagamento: pix, débito e crédito'),
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
