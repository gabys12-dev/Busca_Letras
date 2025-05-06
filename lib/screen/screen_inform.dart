import 'package:flutter/material.dart';
import 'package:flutter_buscaletras/screen/screen_menu.dart'; // Adicione seu import

void main() {
  runApp(const ScreenInform());
}

class ScreenInform extends StatelessWidget {
  const ScreenInform({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca Letras',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF004195),
        ),
      ),
      home: const MyHomePage(title: 'Sobre o Jogo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ScreenMenu()),
              (route) => false,
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF004195),
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'InriaSans',
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Text(
            '''Sobre o "Busca Letras"

O "Busca Letras" é um jogo divertido e educativo de caça-palavras, criado para estimular o raciocínio, a memória e o vocabulário dos jogadores de todas as idades.

Com diferentes modos de jogo, você pode escolher entre desafios cronometrados, temáticos e clássicos, explorando palavras em diversas direções e categorias.

O aplicativo foi desenvolvido com carinho pelos alunos Gabryella Gonçalves, Rafael Rocha, Anthony Cardoso e Kaio Marcio, com o objetivo de oferecer entretenimento saudável, acessível e enriquecedor.

Obrigado por jogar! Esperamos que você se divirta tanto quanto nós nos divertimos criando o jogo. 💙

Versão 1.0.0
''',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 1.5,
              color: Color(0xFF24293E),
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF3570BC),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.arrow_back, size: 40), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.circle, size: 35), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.square, size: 35), label: ''),
          ],
        ),
      ),
    );
  }
}
