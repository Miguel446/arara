import 'package:flutter/material.dart';

import '../../pages/avaliacoes.dart';
import '../../pages/inicio.dart';
import '../../pages/noticias.dart';
import '../../pages/perfil.dart';

class HomePageController extends ChangeNotifier {
  int currentPageIndex = 0;
  IconData buttonIcon = Icons.explore;
  String buttonText = 'Explore ';

  final telas = <Widget>[
    const TelaInicio(),
    const TelaNoticias(),
    const TelaAvaliacoes(),
    const TelaPerfil()
  ];

  bool get isButtonVisible => currentPageIndex == 0 || currentPageIndex == 2;
  Widget get currentTab => telas.elementAt(currentPageIndex);

  void changeTab(int index) {
    currentPageIndex = index;
    if (index == 2) {
      buttonText = "Avaliar ";
      buttonIcon = Icons.reviews;
    } else {
      buttonText = "Explore ";
      buttonIcon = Icons.explore;
    }

    notifyListeners();
  }
}
