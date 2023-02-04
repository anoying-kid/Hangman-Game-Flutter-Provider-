import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hangman_game_flutter/provider/player_data.dart';
import 'package:provider/provider.dart';

final answerController = TextEditingController();

class Keyboard extends StatelessWidget {
  Keyboard({super.key});

  void _onSave(PlayerData data) {
    // final data = Provider.of<PlayerData>(context, listen: false);
    final String newLetter = answerController.text;
    final Set playerLetters = data.playerLetters;
    final String word = data.word;
    final String dashword = data.dashWord;
    final int hangmanPngLoc = data.hangmanPngLoc;
    bool isWordChanged = false;
    if (!playerLetters.contains(newLetter)) {
      data.addNewLetter(newLetter);
      String newWord = '';
      for (int i = 0; i < word.length; i++) {
        if (dashword[i] == '_' && word[i] == newLetter) {
          isWordChanged = true;
          newWord += word[i];
        } else {
          newWord += dashword[i];
        }
      }

      if (isWordChanged) {
        data.changeDashWord(newWord);
      } else {
        data.newBodyPart();
      }
      if (word == dashword) {
        data.roundClear();
      }
    }
    answerController.clear();
    // print(dat);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PlayerData>(context, listen: false);
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      width: MediaQuery.of(context).size.width / 6,
      height: MediaQuery.of(context).size.height * 0.45,
      child: TextField(
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z]"))],
        // readOnly: widget.readOnly,
        onEditingComplete: () {
          _onSave(data);
        },
        textInputAction: TextInputAction.done,
        cursorColor: Colors.black,
        decoration: const InputDecoration(
          counterText: '',
        ),
        maxLength: 1,
        style: const TextStyle(fontSize: 50),
        autofocus: true,
        controller: answerController,
      ),
    );
  }
}
