import 'package:flutter/material.dart';
import 'game_page.dart'; 

class ChooseLevelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Escolha o Nível")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Fácil'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GamePage(maxAttempts: 10, maxNumber: 100)),
              ),
            ),
            ElevatedButton(
              child: Text('Médio'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GamePage(maxAttempts: 5, maxNumber: 500)),
              ),
            ),
            ElevatedButton(
              child: Text('Difícil'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GamePage(maxAttempts: 3, maxNumber: 1000)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
