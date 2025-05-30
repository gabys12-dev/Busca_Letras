import 'package:flutter/material.dart';
import 'package:flutter_buscaletras/screen/screen_play.dart';
import 'package:flutter_buscaletras/widget/widget_word_search.dart';

class ScreenPlayday extends StatefulWidget {
  // Mudar para StatefulWidget
  const ScreenPlayday({super.key});

  @override
  State<ScreenPlayday> createState() => _ScreenPlaydayState();
}

class _ScreenPlaydayState extends State<ScreenPlayday> {
  // O tabuleiro e as palavras válidas agora podem ser definidos no State
  final List<List<String>> _board = [
    ['X', 'G', 'A', 'T', 'E', 'F', 'R', 'S', 'R', 'I', 'B'],
    ['Y', 'B', 'C', 'D', 'U', 'J', 'J', 'F', 'B', 'R', 'Z'],
    ['W', 'P', 'D', 'K', 'F', 'L', 'U', 'T', 'T', 'E', 'R'],
    ['T', 'Y', 'E', 'M', 'B', 'V', 'T', 'G', 'L', 'M', 'T'],
    ['F', 'M', 'W', 'O', 'O', 'N', 'X', 'L', 'V', 'U', 'A'],
    ['Y', 'D', 'Q', 'Y', 'C', 'G', 'W', 'V', 'T', 'C', 'M'],
    ['A', 'T', 'W', 'X', 'O', 'O', 'O', 'C', 'L', 'W', 'O'],
    ['Z', 'T', 'H', 'U', 'I', 'M', 'O', 'B', 'I', 'L', 'E'],
    ['Q', 'W', 'A', 'P', 'Y', 'G', 'Z', 'K', 'K', 'E', 'F'],
    ['S', 'D', 'A', 'M', 'R', 'N', 'W', 'D', 'O', 'L', 'I'],
    ['V', 'A', 'W', 'Z', 'I', 'V', 'B', 'G', 'A', 'U', 'S'],
    ['Y', 'R', 'S', 'F', 'A', 'N', 'D', 'R', 'O', 'I', 'D'],
    ['H', 'T', 'Z', 'D', 'C', 'V', 'J', 'O', 'K', 'K', 'G'],
    ['J', 'X', 'C', 'A', 'O', 'D', 'B', 'L', 'A', 'X', 'Q'],
    ['Z', 'R', 'B', 'R', 'D', 'R', 'R', 'H', 'C', 'W', 'R'],
    ['H', 'C', 'B', 'T', 'I', 'N', 'D', 'F', 'O', 'C', 'D'],
    ['L', 'P', 'N', 'K', 'G', 'V', 'B', 'I', 'P', 'P', 'A'],
    ['L', 'S', 'J', 'E', 'O', 'J', 'C', 'F', 'S', 'X', 'E'],
  ];
  final Set<String> _validWords = {
    'FLUTTER',
    'DART',
    'CODIGO',
    'MOBILE',
    'ANDROID'
  };

  void _onPuzzleComplete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Caça do Dia Concluída!'),
        content:
            const Text('Parabéns! Você encontrou todas as palavras do dia.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o AlertDialog
              Navigator.pushReplacement(
                // Opcional: Voltar para a tela principal ou menu
                context,
                MaterialPageRoute(builder: (context) => const ScreenPlay()),
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004195),
        title: const Text(
          'Caça do Dia',
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenPlay()),
            );
          },
        ),
      ),
      body: WordSearchScreen(
        board: _board, // Usar a variável do State
        validWords: _validWords, // Usar a variável do State
        onDone: _onPuzzleComplete, // Passar a nova função de callback
      ),
    );
  }
}
