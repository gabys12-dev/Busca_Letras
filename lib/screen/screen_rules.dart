import 'package:flutter/material.dart';
import 'package:flutter_buscaletras/screen/screen_menu.dart'; // Import necessário

void main() {
  runApp(const ScreenRules());
}

class ScreenRules extends StatelessWidget {
  const ScreenRules({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca Letras',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF004195),
        ),
      ),
      home: const MyHomePage(title: 'Regras do Jogo'),
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
            '''Regras do Jogo:

1. O objetivo do jogo é encontrar todas as palavras ocultas em um caça-palavras.

2. As palavras podem estar dispostas nas direções: horizontal, vertical e diagonal — tanto para frente quanto para trás.

3. Ao encontrar uma palavra, toque e arraste para selecioná-la. Se estiver correta, ela será destacada automaticamente.

4. Existem diferentes modos de jogo:
- Clássico: Encontre todas as palavras no menor tempo possível.
- Tempo: Encontre o máximo de palavras antes do tempo acabar.
- Temático: As palavras seguem um tema específico, como "animais", "esportes", etc.

5. Não há penalidade por erros, mas quanto mais rápido você concluir, maior será sua pontuação!

Divirta-se e boa sorte!''',
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
