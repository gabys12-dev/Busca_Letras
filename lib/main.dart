import 'package:flutter/material.dart';
import 'package:flutter_buscaletras/screen/screen_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca Letras',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF004195)),
        useMaterial3: true,
      ),
      home: const ScreenMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}
