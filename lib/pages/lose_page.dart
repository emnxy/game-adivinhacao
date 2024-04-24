import 'package:flutter/material.dart';

class LosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Você Perdeu!")),
      body: Center(child: Text("Infelizmente, você não acertou o número.")),
    );
  }
}
