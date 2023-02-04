import 'package:flutter/foundation.dart';
import 'package:hangman_game_flutter/modal/difficulty.dart';

import 'package:word_generator/word_generator.dart';

class PlayerData with ChangeNotifier {
  static String _word = '';
  static String _dashWord = '';

  Map<String, dynamic> _data = {
    'playerLifes': 3,
    'hangmanPngLoc': 0,
    'showAnswer': false,
    'hintsLeft': 3,
    'userScore': 0,
    'word': _word,
    'dashWord': _dashWord,
    'isRoundEnded': true,
  };

  void addDifficulty(Difficulty difficulty) {
    String newWord = WordGenerator().randomNoun();
    List wordLength;
    if (difficulty == Difficulty.easy) {
      wordLength = [0, 5];
    } else if (difficulty == Difficulty.medium) {
      wordLength = [5, 8];
    } else {
      wordLength = [8, 12];
    }
    while (newWord.contains('-') ||
        newWord.length < wordLength[0] ||
        newWord.length >= wordLength[1]) {
      newWord = WordGenerator().randomNoun();
    }
    _data['word'] = newWord;
    _data['dashWord'] = '_' * newWord.length;
    // _data['isRoundEnded'] = false;
    // notifyListeners();
  }

  Map<String, dynamic> get data {
    return {..._data};
  }
}
