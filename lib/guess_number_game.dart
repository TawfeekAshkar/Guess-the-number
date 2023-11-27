import 'package:flutter/material.dart';
import 'guess_number_screen.dart';

class GuessNumberGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess the Number',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: GuessNumberScreen(),
    );
  }
}
