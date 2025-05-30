import 'package:flutter/material.dart';
import 'package:flutter_buscaletras/screen/screen_play.dart';
import 'package:flutter_buscaletras/widget/widget_word_search.dart';
import 'package:flutter_buscaletras/utils/puzzle_generator.dart'; // Importe o gerador

class ScreenPlayclassic extends StatefulWidget {
  const ScreenPlayclassic({super.key});

  @override
  State<ScreenPlayclassic> createState() => _ScreenPlayclassicState();
}

class _ScreenPlayclassicState extends State<ScreenPlayclassic> {
  int puzzleIndex = 0;
  late final List<Map<String, dynamic>>
      puzzles; // Agora será inicializado no initState

  @override
  void initState() {
    super.initState();
    final generator = PuzzleGenerator();
    final int rows = 18; // Definir o número de linhas do seu tabuleiro
    final int cols = 11; // Definir o número de colunas do seu tabuleiro

    puzzles = [
      generator.generatePuzzle(
          ['RAIO', 'CAMISA', 'GIRASSOL', 'LUA', 'FUTSAL'], rows, cols),
      generator.generatePuzzle(
          ['CHAVE', 'PORTA', 'JANELA', 'PAREDE', 'TELHADO'], rows, cols),
      generator.generatePuzzle(
          ['LIMAO', 'LARANJA', 'MORANGO', 'MELANCIA', 'PERA'], rows, cols),
      generator.generatePuzzle(
          ['CACHORRO', 'GATO', 'PATO', 'GALINHA', 'PEIXE'], rows, cols),
      generator.generatePuzzle(
          ['SOL', 'CHUVA', 'VENTO', 'NEVE', 'TROVOA'], rows, cols),
      generator.generatePuzzle(
          ['CONTINENTE', 'MANGA', 'PAIS', 'SOL', 'ESTADO'], rows, cols),
      generator.generatePuzzle(
          ['RIO', 'RUA', 'GELO', 'CASA', 'TELHADO'], rows, cols),
      generator.generatePuzzle(
          ['CIDADE', 'AGUA', 'FOGO', 'ARVORE', 'NUMERO'], rows, cols),
      generator.generatePuzzle(
          ['MUCURA', 'CAMALEAO', 'FRANGO', 'GALO', 'URSO'], rows, cols),
      generator.generatePuzzle(
          ['REMO', 'PAYSANDU', 'FLAMENGO', 'TUNA', 'VASCO'], rows, cols),
    ];
  }

  void nextPuzzle() {
    if (puzzleIndex < puzzles.length - 1) {
      setState(() {
        puzzleIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Parabéns!'),
          content: const Text('Você completou todos os caça-palavras.'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  puzzleIndex = 0;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Jogar novamente'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004195),
        title: const Text(
          'Jogo Clássico',
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
      body: Column(
        children: [
          Expanded(
            child: WordSearchScreen(
              key: ValueKey(puzzleIndex),
              board: puzzles[puzzleIndex]['board'],
              validWords: Set<String>.from(puzzles[puzzleIndex]['validWords']),
              onDone: nextPuzzle,
            ),
          ),
        ],
      ),
    );
  }
}
