import 'dart:math';
import 'package:flutter/material.dart';
import 'win_page.dart';
import 'lose_page.dart';

class GamePage extends StatefulWidget {
  final int maxAttempts;
  final int maxNumber;

  GamePage({required this.maxAttempts, required this.maxNumber});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late int _generatedNumber;
  TextEditingController _controller = TextEditingController();
  String _feedbackText = '';
  int _attempts = 0;

  @override
  void initState() {
    super.initState();
    _generatedNumber = Random().nextInt(widget.maxNumber) + 1;
  }

  void checkGuess(int guess) {
    if (_attempts < widget.maxAttempts - 1) {
      setState(() {
        _attempts++;
        if (guess > _generatedNumber) {
          _feedbackText = 'Tente um número menor. Tentativas restantes: ${widget.maxAttempts - _attempts}';
        } else if (guess < _generatedNumber) {
          _feedbackText = 'Tente um número maior. Tentativas restantes: ${widget.maxAttempts - _attempts}';
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WinPage()));
          return;
        }
      });
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LosePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adivinhe o Número")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tente adivinhar o número entre 1 e ${widget.maxNumber}:',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Insira seu palpite aqui',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  final guess = int.tryParse(value);
                  if (guess != null) {
                    checkGuess(guess);
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final guess = int.tryParse(_controller.text);
                if (guess != null) {
                  checkGuess(guess);
                }
              },
              child: Text('Adivinhar'),
            ),
            Text(
              _feedbackText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
