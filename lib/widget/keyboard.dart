import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hangman_game_flutter/provider/player_data.dart';
import 'package:provider/provider.dart';

class Keyboard extends StatelessWidget {
  Keyboard({super.key});
  final answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PlayerData>(context, listen: false);
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      width: MediaQuery.of(context).size.width / 6,
      height: MediaQuery.of(context).size.height * 0.45,
      child: TextField(
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z]"))],
        onEditingComplete: () {
          data.gameLogic(answerController.text);
          answerController.clear();
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
