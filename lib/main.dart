import 'package:flutter/material.dart';
import 'pages/choose_level_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Jogo da Adivinhação',
    theme: ThemeData.dark(),
    home: ChooseLevelPage(),
  ));
}
