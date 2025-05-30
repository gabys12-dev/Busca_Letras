import 'dart:math';

// Classe para representar uma posição (linha, coluna)
class Point {
  final int row;
  final int col;
  const Point(this.row, this.col);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point &&
          runtimeType == other.runtimeType &&
          row == other.row &&
          col == other.col;

  @override
  int get hashCode => row.hashCode ^ col.hashCode;
}

// Direções possíveis para as palavras (AGORA APENAS HORIZONTAL E VERTICAL)
enum Direction {
  horizontal,
  vertical,
}

// Extensão para obter o delta da direção
extension DirectionExtension on Direction {
  Point get delta {
    switch (this) {
      case Direction.horizontal:
        return const Point(0, 1);
      case Direction.vertical:
        return const Point(1, 0);
    }
  }
}

class PuzzleGenerator {
  final Random _random = Random();
  final List<String> _alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

  // Preenche o tabuleiro com uma letra inicial (pode ser vazia ou 'B')
  List<List<String>> _createEmptyBoard(int rows, int cols, String filler) {
    return List.generate(rows, (_) => List.generate(cols, (_) => filler));
  }

  // Verifica se a palavra pode ser colocada na posição e direção dadas
  bool _canPlaceWord(
      List<List<String>> board, String word, Point start, Direction direction) {
    int rows = board.length;
    int cols = board[0].length;
    Point delta = direction.delta;

    for (int i = 0; i < word.length; i++) {
      int r = start.row + i * delta.row;
      int c = start.col + i * delta.col;

      if (r < 0 || r >= rows || c < 0 || c >= cols) {
        return false; // Fora dos limites
      }
      if (board[r][c] != 'B' && board[r][c] != word[i]) {
        return false; // Conflito com outra letra
      }
    }
    return true;
  }

  // Coloca a palavra no tabuleiro
  void _placeWord(
      List<List<String>> board, String word, Point start, Direction direction) {
    Point delta = direction.delta;
    for (int i = 0; i < word.length; i++) {
      int r = start.row + i * delta.row;
      int c = start.col + i * delta.col;
      board[r][c] = word[i];
    }
  }

  // Gera um novo tabuleiro de caça-palavras
  Map<String, dynamic> generatePuzzle(List<String> words, int rows, int cols) {
    List<List<String>> board =
        _createEmptyBoard(rows, cols, 'B'); // Inicia com 'B'

    // Sort words by length in descending order to place longer words first
    List<String> sortedWords = List.from(words)
      ..sort((a, b) => b.length.compareTo(a.length));

    for (String word in sortedWords) {
      bool placed = false;
      int attempts = 0;
      const maxAttempts =
          1000; // Limite de tentativas para evitar loops infinitos

      while (!placed && attempts < maxAttempts) {
        attempts++;
        Point start = Point(_random.nextInt(rows), _random.nextInt(cols));
        // Seleciona apenas entre as direções horizontal e vertical
        Direction direction =
            Direction.values[_random.nextInt(Direction.values.length)];

        // Tenta colocar a palavra na direção original
        if (_canPlaceWord(board, word, start, direction)) {
          _placeWord(board, word, start, direction);
          placed = true;
        } else {
          // Se não conseguir, tenta colocar a palavra invertida (opcional, mas comum em caça-palavras)
          String reversedWord = word.split('').reversed.join();
          if (_canPlaceWord(board, reversedWord, start, direction)) {
            _placeWord(board, reversedWord, start, direction);
            placed = true;
          }
        }
      }
      if (!placed) {
        print(
            'Aviso: Não foi possível colocar a palavra "$word" no tabuleiro. Tente aumentar o tamanho do tabuleiro ou reduzir o número de palavras.');
      }
    }

    // Preenche os espaços restantes com letras aleatórias
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (board[r][c] == 'B') {
          board[r][c] = _alphabet[_random.nextInt(_alphabet.length)];
        }
      }
    }

    return {
      'board': board,
      'validWords': words, // Mantém as palavras originais (não invertidas)
    };
  }
}
