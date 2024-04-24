import 'package:flutter/material.dart';

class WinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Você Ganhou!")),
      body: Center(child: Text("Parabéns, você acertou o número!")),
    );
  }
}
