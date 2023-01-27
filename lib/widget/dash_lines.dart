import 'package:flutter/material.dart';

class DashLines extends StatefulWidget {
  final String word;
  final bool showAnswer;
  const DashLines({super.key, required this.word, this.showAnswer = false});

  @override
  State<DashLines> createState() => _DashLinesState();
}


class _DashLinesState extends State<DashLines> {

  Color reqColor() {
    if (widget.showAnswer) return Colors.green;
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final String dashWord = widget.word.split('').join(' ');
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
