import 'package:flutter/material.dart';

class DashLines extends StatelessWidget {
  final String _word;
  final bool _showAnswer;
  const DashLines({super.key, required word, showAnswer = false}) : _word = word , _showAnswer = showAnswer;

  Color reqColor() {
    if (_showAnswer) return Colors.green;
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final String dashWord = _word.split('').join(' ');
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      width: double.infinity,
      child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            dashWord,
            style: TextStyle(fontSize: 50, color: reqColor()),
            overflow: TextOverflow.visible,
          )),
    );
  }
}
