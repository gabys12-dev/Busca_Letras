import 'package:flutter/material.dart';
import 'package:flutter_buscaletras/screen/screen_menu.dart';

class ScreenInform extends StatelessWidget {
  const ScreenInform({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004195),
        title: const Text(
          'Sobre o Jogo',
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
            style: const TextStyle(
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
    );
  }
}
