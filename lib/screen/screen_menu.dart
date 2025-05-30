import 'package:flutter/material.dart';
import 'package:flutter_buscaletras/screen/screen_play.dart';
import 'package:flutter_buscaletras/screen/screen_rules.dart';
import 'package:flutter_buscaletras/screen/screen_inform.dart';

class ScreenMenu extends StatelessWidget {
  const ScreenMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004195),
        title: const Text(
          'Busca Letras',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'InriaSans',
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        centerTitle: true,
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
                    MaterialPageRoute(builder: (context) => const ScreenPlay()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5B753),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow, color: Colors.black, size: 45),
                    SizedBox(width: 10),
                    Text("Jogar"),
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
                    MaterialPageRoute(
                        builder: (context) => const ScreenRules()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5B753),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.list, color: Colors.black, size: 42),
                    SizedBox(width: 10),
                    Text("Regras"),
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
                    MaterialPageRoute(
                        builder: (context) => const ScreenInform()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5B753),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info, color: Colors.black, size: 32),
                    SizedBox(width: 10),
                    Text("Sobre"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
