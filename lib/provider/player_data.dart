import 'package:flutter/foundation.dart';
import 'package:hangman_game_flutter/modal/difficulty.dart';

import 'package:word_generator/word_generator.dart';

class PlayerData with ChangeNotifier {
  final Difficulty difficulty;
  static String word = '';
  static String dashWord = '';

  PlayerData({required this.difficulty}) {
    _wordForDifficultyLevel(difficulty);
  }

  void _wordForDifficultyLevel(Difficulty difficultyLevel) {
    String newWord = WordGenerator().randomNoun();
    List wordLength;
    if (difficultyLevel == Difficulty.easy) {
      wordLength = [0, 5];
    } else if (difficultyLevel == Difficulty.medium) {
      wordLength = [5, 8];
    } else {
      wordLength = [8, 12];
    }
    while (newWord.contains('-') ||
        newWord.length < wordLength[0] ||
        newWord.length >= wordLength[1]) {
      newWord = WordGenerator().randomNoun();
    }
    word = newWord;
    dashWord = '_' * word.length;
  }

  Map<String, dynamic> _data = {
    'playerLifes': 3,
    'hangmanPngLoc': 0,
    'showAnswer': false,
    'hintsLeft': 3,
    'userScore': 0,
    'word': word,
    'dashword': dashWord,
  };

  Map<String, dynamic> get data {
    return {..._data};
  }
}
