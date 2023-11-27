import 'package:flutter/material.dart';
import 'dart:math';

class GuessNumberScreen extends StatefulWidget {
  @override
  _GuessNumberScreenState createState() => _GuessNumberScreenState();
}

class _GuessNumberScreenState extends State<GuessNumberScreen> {
  int targetNumber = Random().nextInt(100) + 1;
  int attempts = 5;
  int userGuess = 0;

  void checkGuess() {
    setState(() {
      attempts--;
      if (userGuess == targetNumber) {
        _showDialog(true, "Congratulations!\nThe number was $targetNumber");
      } else {
        String hint = userGuess < targetNumber ? 'Too low!' : 'Too high!';
        if (attempts == 0) {
          _showDialog(false, "Out of attempts!\nThe number was $targetNumber");
        } else {
          _showSnackBar(hint);
        }
      }
    });
  }

  void _showDialog(bool won, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: won ? Text('You won!') : Text('Game Over!'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  targetNumber = Random().nextInt(100) + 1;
                  attempts = 5;
                });
              },
              child: Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guess the Number'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Guess the number (1-100)',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Attempts left: $attempts',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 120.0,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 18.0),
                onChanged: (value) {
                  setState(() {
                    userGuess = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: checkGuess,
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
