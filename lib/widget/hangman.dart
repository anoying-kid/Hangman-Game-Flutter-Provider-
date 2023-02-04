import 'package:flutter/material.dart';

class Hangman extends StatelessWidget {
  final int _hangmanPngLoc;
  const Hangman(this._hangmanPngLoc, {super.key});

  String _hangmanPngPath() {
    return 'assets/images/$_hangmanPngLoc.png';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.33,
      width: double.infinity,
      child: Center(
        child: Image.asset(
          _hangmanPngPath(),
          color: Colors.black,
        ),
      ),
    );
  }
}
