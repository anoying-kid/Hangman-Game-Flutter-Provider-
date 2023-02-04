import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:hangman_game_flutter/modal/difficulty.dart';

import 'package:word_generator/word_generator.dart';

class PlayerData with ChangeNotifier {
  Difficulty _difficulty = Difficulty.easy;
  int playerLifes = 3;
  int hangmanPngLoc = 0;
  int hintsLeft = 3;
  int userScore = 0;
  String word = '';
  String dashWord = '';
  Set<String> playerLetters = {};

  void addNewWord(Difficulty difficulty) {
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

  void addNewLetter(String newLetter) {
    playerLetters.add(newLetter);
  }

  void changeDashWord(String newWord) {
    dashWord = newWord;
  }

  void newBodyPart() {
    hangmanPngLoc += 1;
  }

  void roundClear() {
    userScore += 1;
    hangmanPngLoc = 0;
    addNewWord(_difficulty);
  }

  void roundLose() {
    playerLifes -= 1;
    hangmanPngLoc = 0;
    playerLetters.clear();
    addNewWord(_difficulty);
  }

  void restartGame() {
    playerLifes = 3;
    hangmanPngLoc = 0;
    hintsLeft = 3;
    userScore = 0;
    playerLetters.clear();
    addNewWord(_difficulty);
  }

  void gameLogic(String newLetter) {
    bool isWordChanged = false;
    if (!playerLetters.contains(newLetter)) {
      playerLetters.add(newLetter);
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
        changeDashWord(newWord);
      } else {
        newBodyPart();
        if (hangmanPngLoc == 5) {
          roundLose();
        }
      }
    }
    if (word == dashWord) {
      roundClear();
    }
    notifyListeners();
  }

  void wantHint() {
    int randomIndex = Random().nextInt(word.length);
    while (playerLetters.contains(word[randomIndex])) {
      randomIndex = Random().nextInt(word.length);
    }
    hintsLeft -= 1;
    gameLogic(word[randomIndex]);
  }
}
