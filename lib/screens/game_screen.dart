import 'dart:math';

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
  int _playerLifes = 3;
  int _hangmanPngLoc = 0;
  String _word = WordGenerator().randomNoun();
  late String _dashWord = '_' * _word.length;
  bool _showAnswer = false;
  int _hintsLeft = 3;
  final Set<String> _userWords = {};
  int _userScore = 0;

  void _restartGame({bool livesEnded = false, bool roundEnded = false}) {
    if (livesEnded) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _hintsLeft = 3;
          _playerLifes = 3;
        });
      });
    }
    _word = WordGenerator().randomNoun();
    _dashWord = '_' * _word.length;
    _hangmanPngLoc = 0;
    _userWords.clear();
    _userScore += 1;
  }

  void _answer() {
    setState(() {
      _showAnswer = true;
    });
    Future.delayed(const Duration(seconds: 1), (() {
      setState(() {
        if (_word != _dashWord) _playerLifes -= 1;
        _showAnswer = false;
        _restartGame(roundEnded: true);
      });
    }));
  }

  void _onSave(String newLetter) {
    if (!_userWords.contains(newLetter)) {
      _userWords.add(newLetter);
      bool isWordChanged = false;
      String newWord = '';
      for (int i = 0; i < _word.length; i++) {
        if (_dashWord[i] == '_' && _word[i] == newLetter) {
          isWordChanged = true;
          newWord += _word[i];
        } else {
          newWord += _dashWord[i];
        }
      }

      if (isWordChanged) {
        _dashWord = newWord;
        setState(() {});
      } else {
        _hangmanPngLoc += 1;
        setState(() {});
        if (_hangmanPngLoc == 6) {
          _answer();
        }
      }

      if (_word == _dashWord) {
        // print('this ran');
        _answer();
      }
    } else {
      // text word is used;
    }
  }

  void _showHintWord() {
    int randomIndex = Random().nextInt(_word.length);
    while (_userWords.contains(_word[randomIndex])) {
      randomIndex = Random().nextInt(_word.length);
    }
    _hintsLeft -= 1;
    _onSave(_word[randomIndex]);
  }

  @override
  Widget build(BuildContext context) {
    // print(_word == _dashWord);
    // print(_word);
    if (_playerLifes == 0) {
      Future.delayed(const Duration(milliseconds: 100), () {
        showDialog(context: context, builder: (_) => const RestartGame())
            .then((value) {
          (value)
              ? _restartGame(livesEnded: true)
              : _restartGame(livesEnded: false);
        });
      });
    }

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
              PlayerDetails(_playerLifes, _hintsLeft, _userScore, _showHintWord),
              Hangman(_hangmanPngLoc),
              (_showAnswer)
                  ? DashLines(
                      word: _word,
                      showAnswer: true,
                    )
                  : DashLines(word: _dashWord),
              (_showAnswer)
                  ? Keyboard(
                      onSave: _onSave,
                      readOnly: _showAnswer,
                    )
                  : Keyboard(onSave: _onSave),
            ],
          ),
        ]));
  }
}
