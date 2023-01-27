import 'package:flutter/material.dart';

class Hangman extends StatefulWidget {
  final int loc;
  const Hangman(this.loc, {super.key});

  @override
  State<Hangman> createState() => _HangmanState();
}

class _HangmanState extends State<Hangman> {
  String hangmanPng() {
    return 'assets/images/${widget.loc}.png';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.33,
      width: double.infinity,
      child: Center(
        child: Image.asset(
          hangmanPng(),
          color: Colors.black,
        ),
      ),
    );
  }
}
