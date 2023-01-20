import 'package:arara/enums/color_enum.dart';
import 'package:flutter/material.dart';
import 'pages/inicio.dart';
import 'pages/noticias.dart';
import 'pages/avaliacoes.dart';
import 'pages/perfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arara',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage('Arara'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(this.title, {super.key});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  int _indiceAtual = 0;
  String textoBotao = "Explore ";
  Icon iconeBotao = const Icon(Icons.explore);

  final List<Widget> _telas = [
    const TelaInicio(),
    const TelaNoticias(),
    const TelaAvaliacoes(),
    const TelaPerfil()
  ];

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
      if(index == 2){
        textoBotao = "Avaliar ";
        iconeBotao = const Icon(Icons.reviews);
      }else{
        textoBotao = "Explore ";
        iconeBotao = const Icon(Icons.explore);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        selectedItemColor: ColorEnum.roxo,
        unselectedItemColor: const Color(0x801E1E1E),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 28,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search,),
            label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.feed),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.reviews),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: ''
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: _indiceAtual == 0 || _indiceAtual == 2,
        child: FloatingActionButton.extended(
          onPressed: () => {
          }, label: Row(
          children: [Text(textoBotao), iconeBotao],
        ),
        backgroundColor: ColorEnum.roxo,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
