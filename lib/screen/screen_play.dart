import 'package:flutter/material.dart';
import 'package:flutter_buscaletras/screen/screen_playday.dart';
import 'package:flutter_buscaletras/screen/screen_playclassic.dart';
import 'package:flutter_buscaletras/screen/screen_playtemp.dart';
import 'package:flutter_buscaletras/screen/screen_playtema.dart';
import 'package:flutter_buscaletras/screen/screen_menu.dart';

class ScreenPlay extends StatelessWidget {
  const ScreenPlay({super.key});

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 35),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const ScreenMenu()),
              (route) => false,
            );
          },
        ),
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
                    MaterialPageRoute(
                        builder: (context) => const ScreenPlayday()),
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
                    MaterialPageRoute(
                        builder: (context) => const ScreenPlayclassic()),
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
                    MaterialPageRoute(
                        builder: (context) => const ScreenPlaytemp()),
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
                    MaterialPageRoute(
                        builder: (context) => const ScreenPlaytema()),
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
    );
  }
}
