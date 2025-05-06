import 'package:flutter/material.dart';
import 'package:flutter_buscaletras/screen/screen_play.dart';

void main() {
  runApp(const ScreenPlayclassic());
}

class ScreenPlayclassic extends StatelessWidget {
  const ScreenPlayclassic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca Letras',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF004195),
        ),
      ),
      home: const MyHomePage(title: 'Busca Letras'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int gridSize = 11;
  late final List<String> letters;

  @override
  void initState() {
    super.initState();
    letters = List.generate(
      gridSize * gridSize,
          (index) => String.fromCharCode(65 + (index % 26)),
    );

    insertWord("RAIO", startRow: 1, startCol: 1, direction: "H"); // Horizontal
    insertWord("CAMISA", startRow: 3, startCol: 2, direction: "V");    // Vertical
    insertWord("GIRRASOL", startRow: 5, startCol: 4, direction: "D");  // Diagonal
  }

  void insertWord(String word, {required int startRow, required int startCol, required String direction}) {
    for (int i = 0; i < word.length; i++) {
      int row = startRow;
      int col = startCol;

      if (direction == "H") {
        col += i;
      } else if (direction == "V") {
        row += i;
      } else if (direction == "D") {
        row += i;
        col += i;
      }

      int index = row * gridSize + col;
      if (index < letters.length) {
        letters[index] = word[i];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004195),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'InriaSans',
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 35),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenPlay())
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: gridSize,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 0.8,
                children: letters.map((letter) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5B753),
                      border: Border.all(color: const Color(0xFFCC902F)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      letter,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Palavras para encontrar:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children: const [
                Chip(label: Text("RAIO")),
                Chip(label: Text("CAMISA")),
                Chip(label: Text("GIRRASOL")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}