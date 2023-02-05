import 'package:flutter/material.dart';
import 'package:hangman_game_flutter/provider/player_data.dart';
import 'package:provider/provider.dart';

class DashLines extends StatefulWidget {
  @override
  State<DashLines> createState() => _DashLinesState();
}

class _DashLinesState extends State<DashLines> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PlayerData>(context);
    String dashWord = data.dashWord.split('').join(' ');
    if (data.showAnswer) {
      setState(() {
        dashWord = data.word;
      });
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          data.roundLose();
          data.notifyListeners();
        });
      });
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      width: double.infinity,
      child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            dashWord,
            style: TextStyle(fontSize: 50),
            overflow: TextOverflow.visible,
          )),
    );
  }
}
