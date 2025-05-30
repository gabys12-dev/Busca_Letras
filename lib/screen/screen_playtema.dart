import 'package:flutter/material.dart';
import 'package:flutter_buscaletras/screen/screen_play.dart';
import 'package:flutter_buscaletras/widget/widget_word_search.dart';
import 'package:flutter_buscaletras/utils/puzzle_generator.dart'; // Importe o gerador

class ScreenPlaytema extends StatefulWidget {
  const ScreenPlaytema({super.key});

  @override
  State<ScreenPlaytema> createState() => _ScreenPlaytemaState();
}

class _ScreenPlaytemaState extends State<ScreenPlaytema> {
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
          ['PEDROI', 'NAPOLEAO', 'GUERRA', 'PARAGUAI', 'SAPIENS'], rows, cols),
      generator.generatePuzzle(
          ['HISTORIA', 'CIVILIZACAO', 'REVOLUCAO', 'IMPERIO', 'CULTURA'],
          rows,
          cols),
      generator.generatePuzzle(
          ['MUSEU', 'ARQUEOLOGIA', 'ANTIGUIDADE', 'MEDIEVAL', 'MODERNA'],
          rows,
          cols),
      generator.generatePuzzle(
          ['PIRAMIDE', 'ROMANOS', 'GREGOS', 'EGITO', 'CONQUISTA'], rows, cols),
      generator.generatePuzzle(
          ['IMPERIO', 'COLONIZACAO', 'INDIGENAS', 'ESCRAVIDAO', 'DEMOCRACIA'],
          rows,
          cols),
      generator.generatePuzzle(
          ['PORTUGAL', 'FRANÇA', 'INGLATERRA', 'NAVIOS', 'JOANA'], rows, cols),
      generator.generatePuzzle(
          ['ARTE', 'CAVERVAS', 'ANTIGO', 'PINTURAS', 'PESCA'], rows, cols),
      generator.generatePuzzle(
          ['ESPECIES', 'DINOSSAURO', 'OURO', 'PRATA', 'FERRO'], rows, cols),
      generator.generatePuzzle(
          ['AMERICAS', 'MAIAS', 'ASTECAS', 'TUPINIQUINS', 'INCAS'], rows, cols),
      generator.generatePuzzle(
          ['MODERNA', 'COLONIA', 'INDIO', 'ESCRAVOS', 'GOLPE'], rows, cols),
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
          'Jogo Temático',
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
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Tema: História',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
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
