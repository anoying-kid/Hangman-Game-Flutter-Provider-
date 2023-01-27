import 'package:flutter/material.dart';
import 'package:hangman_game_flutter/widget/dash_lines.dart';

import 'package:hangman_game_flutter/widget/hangman.dart';
import 'package:hangman_game_flutter/widget/keyboard.dart';
import 'package:hangman_game_flutter/widget/player_details.dart';
import 'package:hangman_game_flutter/widget/restart_game.dart';

import 'package:word_generator/word_generator.dart';

class GameScreen extends StatefulWidget {
  static const routeName = '/game-screen';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int playerLifes = 1;
  int hangmanPngLoc = 0;
  String word = WordGenerator().randomNoun();
  late String dashWord = '_' * word.length;
  bool showAnswer = false;

  void restartGame({bool livesEnded = false, bool roundEnded = false}) {
    if (livesEnded) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          playerLifes = 3;
        });
      });
    }
    word = WordGenerator().randomNoun();
    dashWord = '_' * word.length;
    hangmanPngLoc = 0;
  }

  void answer() {
    setState(() {
      showAnswer = true;
    });
    Future.delayed(const Duration(seconds: 1), (() {
      setState(() {
        playerLifes -= 1;
        showAnswer = false;
        restartGame(roundEnded: true);
      });
    }));
  }

  void onSave(String newLetter) {
    bool isWordChanged = false;
    String newWord = '';
    for (int i = 0; i < word.length; i++) {
      if (dashWord[i] == '_' && word[i] == newLetter) {
        isWordChanged = true;
        newWord += word[i];
      } else {
        newWord += dashWord[i];
      }
    }

    if (isWordChanged) {
      dashWord = newWord;
      setState(() {});
    } else {
      hangmanPngLoc += 1;
      setState(() {});
      if (hangmanPngLoc == 6) {
        answer();
      }
    }

    if (word == dashWord) {
      answer();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (playerLifes == 0) {
      Future.delayed(Duration(milliseconds: 100), () {
        showDialog(context: context, builder: (_) => RestartGame())
            .then((value) {
          (value)
              ? restartGame(livesEnded: true)
              : restartGame(livesEnded: false);
        });
      });
    }

    print(playerLifes);

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
              PlayerDetails(playerLifes),
              Hangman(hangmanPngLoc),
              // DashLines(dashWord),
              (showAnswer)
                  ? DashLines(
                      word: word,
                      showAnswer: true,
                    )
                  : DashLines(word: dashWord),
              (showAnswer)
                  ? Keyboard(
                      onSave: onSave,
                      readOnly: showAnswer,
                    )
                  : Keyboard(onSave: onSave),
            ],
          ),
        ]));
  }
}
