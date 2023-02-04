import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman_game_flutter/modal/difficulty.dart';
import 'package:hangman_game_flutter/provider/player_data.dart';
import 'package:hangman_game_flutter/widget/dash_lines.dart';

import 'package:hangman_game_flutter/widget/hangman.dart';
import 'package:hangman_game_flutter/widget/keyboard.dart';
import 'package:hangman_game_flutter/widget/player_details.dart';
import 'package:hangman_game_flutter/widget/restart_game.dart';
import 'package:provider/provider.dart';

import 'package:word_generator/word_generator.dart';

class GameScreen extends StatelessWidget {
  static const routeName = '/game-screen';

  // int _playerLifes = 3;
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PlayerData>(context);
    // print(data.data);
    // if (data['playerLifes'] == 0) {
    //   Future.delayed(const Duration(milliseconds: 100), () {
    //     showDialog(context: context, builder: (_) => const RestartGame())
    //         .then((value) {
    //       (value)
    //           ? _restartGame(livesEnded: true)
    //           : Navigator.of(context).pop();
    //     });
    //   });
    // }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/images/bg.jpg',
                fit: BoxFit.fitHeight,
                opacity: const AlwaysStoppedAnimation(0.2)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlayerDetails(data.playerLifes, data.hintsLeft,
                  data.userScore, ''),
              Hangman(data.hangmanPngLoc),
              DashLines(word: data.dashWord),
              Keyboard()
            ],
          ),
        ]));
  }
}
