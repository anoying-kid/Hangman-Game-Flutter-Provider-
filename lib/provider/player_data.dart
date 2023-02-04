import 'package:flutter/foundation.dart';
import 'package:hangman_game_flutter/modal/difficulty.dart';

import 'package:word_generator/word_generator.dart';

class PlayerData with ChangeNotifier {
  Difficulty _difficulty = Difficulty.easy;
  int playerLifes = 3;
  int hangmanPngLoc = 0;
  bool showAnswer = false;
  int hintsLeft = 3;
  int userScore = 0;
  String word = '';
  String dashWord = '';
  bool isRoundEnded = true;
  Set<String> playerLetters = {};

  // static Map<String, dynamic> _data = {
  //   'playerLifes': 3,
  //   'hangmanPngLoc': 0,
  //   'showAnswer': false,
  //   'hintsLeft': 3,
  //   'userScore': 0,
  //   'word': '',
  //   'dashWord': '',
  //   'isRoundEnded': true,
  //   'playerLetters': <String>{},
  // };


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
    word = newWord;
    dashWord = '_' * newWord.length;
    // _data['isRoundEnded'] = false;
    // notifyListeners();
  }

  // Map<String, dynamic> get data {
  //   return {..._data};
  // }

  void addNewLetter(String newLetter){
    playerLetters.add(newLetter);
    // print('this is gay');
    // print(_data);
    notifyListeners();
  }
  void changeDashWord(String newWord) {
    dashWord = newWord;
    notifyListeners();
  }
  void newBodyPart() {
    hangmanPngLoc +=1;
    notifyListeners();
  }
  void roundClear() {
    userScore += 1;
    hangmanPngLoc = 0;
  }
}
