import 'package:flutter/material.dart';
import 'package:flutter_buscaletras/screen/screen_play.dart';
import 'package:flutter_buscaletras/widget/widget_word_search.dart';
import 'package:flutter_buscaletras/utils/puzzle_generator.dart'; // Importe o gerador
import 'dart:async'; // Importe para usar Timer

class ScreenPlaytemp extends StatefulWidget {
  const ScreenPlaytemp({super.key});

  @override
  State<ScreenPlaytemp> createState() => _ScreenPlaytempState();
}

class _ScreenPlaytempState extends State<ScreenPlaytemp> {
  int puzzleIndex = 0;
  late final List<Map<String, dynamic>> puzzles;
  late Timer _timer;
  int _secondsRemaining = 150; // Tempo inicial em segundos para cada puzzle
  int _currentScore = 0; // Pontuação para o puzzle atual

  @override
  void initState() {
    super.initState();
    final generator = PuzzleGenerator();
    final int rows = 18; // Definir o número de linhas do seu tabuleiro
    final int cols = 11; // Definir o número de colunas do seu tabuleiro

    puzzles = [
      generator.generatePuzzle(
          ['CADEIRA', 'COLA', 'TOMADA', 'MESA', 'JANELA'], rows, cols),
      generator.generatePuzzle(
          ['CARRO', 'CASA', 'ARVORE', 'FLOR', 'LIVRO'], rows, cols),
      generator
          .generatePuzzle(['CEU', 'SOL', 'MAR', 'AREIA', 'NUVEM'], rows, cols),
      generator.generatePuzzle(
          ['COMPUTADOR', 'TECLADO', 'MOUSE', 'MONITOR', 'IMPRESSORA'],
          rows,
          cols),
      generator.generatePuzzle(
          ['MANGA', 'COCO', 'LARANJA', 'UVA', 'MACA'], rows, cols),
      generator.generatePuzzle(
          ['TELA', 'IMAGEM', 'LED', 'TELEVISAO', 'CONTROLE'], rows, cols),
      generator.generatePuzzle(
          ['MOTO', 'PREDIO', 'PLANTA', 'FOLHA', 'PAPEL'], rows, cols),
      generator
          .generatePuzzle(['CEU', 'SOL', 'MAR', 'AREIA', 'NUVEM'], rows, cols),
      generator.generatePuzzle(
          ['MAQUINA', 'ROTEADOR', 'CARREGADOR', 'CELULAR', 'INTERNET'],
          rows,
          cols),
      generator.generatePuzzle(
          ['FRUTA', 'COMIDA', 'LAMPADA', 'CHAMINE', 'LUTA'], rows, cols),
    ];

    _startTimer(); // Inicia o temporizador quando o widget é inicializado
  }

  void _startTimer() {
    _secondsRemaining = 150; // Reseta o tempo para cada novo puzzle
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel(); // Cancela o temporizador
          _handleTimeOut(); // Lida com o tempo esgotado
        }
      });
    });
  }

  void _handleTimeOut() {
    // Aqui você pode adicionar lógica para penalizar a pontuação ou simplesmente avançar
    _currentScore -= 20; // Exemplo: penalidade por tempo esgotado
    if (_currentScore < 0)
      _currentScore = 0; // Garante que a pontuação não seja negativa

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tempo Esgotado!'),
        content: const Text('Você não encontrou todas as palavras a tempo.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              nextPuzzle(); // Avança para o próximo puzzle
            },
            child: const Text('Próximo Puzzle'),
          )
        ],
      ),
    );
  }

  void nextPuzzle() {
    _timer.cancel(); // Cancela o temporizador atual antes de avançar

    if (puzzleIndex < puzzles.length - 1) {
      setState(() {
        puzzleIndex++;
        _currentScore = 0; // Reseta a pontuação para o próximo puzzle
      });
      _startTimer(); // Inicia o temporizador para o novo puzzle
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
                  _currentScore = 0; // Reseta a pontuação geral
                });
                Navigator.of(context).pop();
                _startTimer(); // Inicia o temporizador novamente para o primeiro puzzle
              },
              child: const Text('Jogar novamente'),
            )
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer
        .cancel(); // Certifique-se de cancelar o temporizador quando o widget for descartado
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004195),
        title: const Text(
          'Jogo Tempo',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tempo Restante: $_secondsRemaining segundos',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: WordSearchScreen(
              key: ValueKey(puzzleIndex),
              board: puzzles[puzzleIndex]['board'],
              validWords: Set<String>.from(puzzles[puzzleIndex]['validWords']),
              onDone: nextPuzzle,
              onWordFound: (wordScore) {
                setState(() {
                  _currentScore += wordScore;
                });
              },
              initialScore: _currentScore, // Passa a pontuação atual
            ),
          ),
        ],
      ),
    );
  }
}
