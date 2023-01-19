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

  final List<Widget> _telas = [
    const TelaInicio(),
    TelaNoticias(),
    TelaAvaliacoes(),
    TelaPerfil()
  ];

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        selectedItemColor: const Color(0xffa071a0),
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
      body: _telas[_indiceAtual],
      floatingActionButton: Visibility(
        visible: _indiceAtual == 0,
        child: FloatingActionButton.extended(
          onPressed: null, label: Row(
          children: const [Text('Explore '), Icon(Icons.explore)],
        ),
        backgroundColor: const Color(0xffa071a0),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
