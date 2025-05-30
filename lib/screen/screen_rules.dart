import 'package:flutter/material.dart';
import 'package:flutter_buscaletras/screen/screen_menu.dart';

class ScreenRules extends StatelessWidget {
  const ScreenRules({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004195),
        title: const Text(
          'Regras do Jogo',
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
