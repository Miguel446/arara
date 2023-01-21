import 'package:arara/ui/pages/search_tab_page.dart';
import 'package:flutter/material.dart';

import '../enums/color_enum.dart';

class TelaInicio extends StatelessWidget {
  const TelaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Logo
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Image(
                  height: 80,
                  image: AssetImage('assets/icone.png'),
                ),
              ),

              //SearchField
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(24),
                        right: Radius.circular(24),
                      ),
                    ),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_alt),
                    hintText: 'Procure por bazares e brechós',
                  ),
                ),
              ),

              //Linha da tab
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
                              style: BorderStyle.solid,
                            ),
                          ),
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

              const SizedBox(
                height: 1200,
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    SearchTabPage(false),
                    SearchTabPage(true),
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
