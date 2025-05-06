import 'package:flutter/material.dart';
import 'package:flutter_buscaletras/screen/screen_playday.dart';
import 'package:flutter_buscaletras/screen/screen_playclassic.dart';
import 'package:flutter_buscaletras/screen/screen_playtemp.dart';
import 'package:flutter_buscaletras/screen/screen_playtema.dart';
import 'package:flutter_buscaletras/screen/screen_menu.dart'; // Import necessário

void main() {
  runApp(const ScreenPlay());
}

class ScreenPlay extends StatelessWidget {
  const ScreenPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca Letras',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF004195),
        ),
      ),
      home: const MyHomePage(title: 'Busca Letras'),
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
  int _selectedIndex = 0; // Define a aba central como padrão

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
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 450,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScreenPlayday()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF5B753),
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Color(0xFFCC902F), width: 5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_arrow, color: Colors.black, size: 45),
                    SizedBox(width: 10),
                    Text("Caça do Dia"),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.white, height: 40),
            SizedBox(
              height: 100,
              width: 450,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScreenPlayclassic()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF5B753),
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Color(0xFFCC902F), width: 5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_arrow, color: Colors.black, size: 40),
                    SizedBox(width: 10),
                    Text("Jogo Clássico"),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.white, height: 40),
            SizedBox(
              height: 100,
              width: 450,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScreenPlaytemp()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF5B753),
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Color(0xFFCC902F), width: 5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_arrow, color: Colors.black, size: 35),
                    SizedBox(width: 10),
                    Text("Jogo Tempo"),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.white, height: 40),
            SizedBox(
              height: 100,
              width: 450,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScreenPlaytema()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF5B753),
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Color(0xFFCC902F), width: 5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_arrow, color: Colors.black, size: 35),
                    SizedBox(width: 10),
                    Text("Jogo Temático"),
                  ],
                ),
              ),
            ),
          ],
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