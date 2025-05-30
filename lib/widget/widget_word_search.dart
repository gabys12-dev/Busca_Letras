import 'dart:math';
import 'package:flutter/material.dart';

class WordSearchScreen extends StatefulWidget {
  final void Function()? onDone;
  final List<List<String>> board;
  final Set<String> validWords;
  final Function(int)? onWordFound; // Novo callback para reportar a pontuação
  final int initialScore; // Nova propriedade para a pontuação inicial

  const WordSearchScreen({
    this.onDone,
    super.key,
    required this.board,
    required this.validWords,
    this.onWordFound, // Tornar opcional
    this.initialScore = 0, // Valor padrão
  });

  @override
  State<WordSearchScreen> createState() => _WordSearchScreenState();
}

class _WordSearchScreenState extends State<WordSearchScreen> {
  final double cellSize = 30;
  late WordSearchGame game;
  late WordSelectionController controller;
  // int score = 0; // A pontuação será gerenciada pela tela pai
  final Set<String> foundWords = {};

  @override
  void initState() {
    super.initState();
    game = WordSearchGame(
      board: widget.board,
      validWords: widget.validWords,
      cellSize: cellSize,
    );
    controller = WordSelectionController(game);
    foundWords.clear();
    // A pontuação não é mais inicializada aqui, mas passada pelo widget.initialScore
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // A pontuação agora é exibida na tela pai (ScreenPlaytemp)
        // const SizedBox(height: 16),
        // Text(
        //   'Pontuação: $score',
        //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        // ),
        // const SizedBox(height: 8),
        Expanded(
          child: Center(
            child: GestureDetector(
              onPanStart: (details) {
                setState(() {
                  controller.onPanStart(details.localPosition);
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  controller.onPanUpdate(details.localPosition);
                });
              },
              onPanEnd: (_) {
                final word = game.getWordFromPath(controller.selectedPath);
                final isCorrect = controller.onPanEnd();

                if (isCorrect && !foundWords.contains(word)) {
                  setState(() {
                    // score += 10; // A pontuação é atualizada pelo widget pai
                    foundWords.add(word);
                    widget.onWordFound
                        ?.call(10); // Reporta a pontuação para a tela pai

                    if (foundWords.length == widget.validWords.length) {
                      widget.onDone?.call();
                    }
                  });
                }
                setState(() {});
              },
              child: CustomPaint(
                painter: WordSelectionPainter(
                  controller.selectedPath,
                  cellSize,
                ),
                child: SizedBox(
                  width: game.board[0].length * cellSize,
                  height: game.board.length * cellSize,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: game.board[0].length,
                    ),
                    itemCount: game.board.length * game.board[0].length,
                    itemBuilder: (context, index) {
                      final row = index ~/ game.board[0].length;
                      final col = index % game.board[0].length;
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: Colors.amberAccent,
                        ),
                        child: Text(
                          game.board[row][col],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Palavras para encontrar:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 10,
          children: widget.validWords.map((word) {
            final found = foundWords.contains(word) ||
                foundWords.contains(word.split('').reversed.join());
            return Chip(
              label: Text(
                word,
                style: TextStyle(
                  color: found ? Colors.white : Colors.black,
                ),
              ),
              backgroundColor: found ? Colors.green : Colors.grey[300],
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class WordSearchGame {
  final List<List<String>> board;
  final Set<String> validWords;
  final double cellSize;

  WordSearchGame({
    required this.board,
    required this.validWords,
    required this.cellSize,
  });

  Point<int> pixelToGrid(Offset offset) {
    final col = (offset.dx ~/ cellSize);
    final row = (offset.dy ~/ cellSize);
    return Point(row, col);
  }

  String getWordFromPath(List<Point<int>> path) {
    String word = '';
    for (final point in path) {
      if (point.x >= 0 &&
          point.x < board.length &&
          point.y >= 0 &&
          point.y < board[0].length) {
        word += board[point.x][point.y];
      }
    }
    return word;
  }

  bool checkIfWordIsValid(String word) {
    return validWords.contains(word) ||
        validWords.contains(word.split('').reversed.join());
  }
}

class WordSelectionController {
  final WordSearchGame game;
  final List<Point<int>> selectedPath = [];

  WordSelectionController(this.game);

  void onPanStart(Offset position) {
    selectedPath.clear();
    selectedPath.add(game.pixelToGrid(position));
  }

  void onPanUpdate(Offset position) {
    final point = game.pixelToGrid(position);
    if (selectedPath.isEmpty ||
        (selectedPath.last != point &&
            (point.x - selectedPath.last.x).abs() <= 1 &&
            (point.y - selectedPath.last.y).abs() <= 1 &&
            point.x >= 0 &&
            point.x < game.board.length &&
            point.y >= 0 &&
            point.y < game.board[0].length)) {
      selectedPath.add(point);
    }
  }

  bool onPanEnd() {
    final word = game.getWordFromPath(selectedPath);
    final isValid = game.checkIfWordIsValid(word);
    selectedPath.clear();
    return isValid;
  }
}

class WordSelectionPainter extends CustomPainter {
  final List<Point<int>> path;
  final double cellSize;

  WordSelectionPainter(this.path, this.cellSize);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    for (final point in path) {
      final rect = Rect.fromLTWH(
        point.y * cellSize,
        point.x * cellSize,
        cellSize,
        cellSize,
      );
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant WordSelectionPainter oldDelegate) {
    return oldDelegate.path != path;
  }
}
