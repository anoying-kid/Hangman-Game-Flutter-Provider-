import 'package:flutter/material.dart';
import 'package:hangman_game_flutter/provider/player_data.dart';
import 'package:provider/provider.dart';

class DashLines extends StatelessWidget {
  // Color reqColor() {
  //   if (_showAnswer) return Colors.green;
  //   return Colors.black;
  // }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PlayerData>(context);
    final String dashWord = data.dashWord.split('').join(' ');
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
