import 'package:flutter/material.dart';
import 'package:hangman_game_flutter/provider/player_data.dart';
import 'package:hangman_game_flutter/widget/dash_lines.dart';

import 'package:hangman_game_flutter/widget/hangman.dart';
import 'package:hangman_game_flutter/widget/keyboard.dart';
import 'package:hangman_game_flutter/widget/player_details.dart';
import 'package:hangman_game_flutter/widget/restart_game.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  static const routeName = '/game-screen';

  AlertDialog exitAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Do you really want to exit?'),
      actions: [
        TextButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.pop(context, true);
              FocusScope.of(context).unfocus();
            }),
        TextButton(
          child: Text('No'),
          onPressed: () {
            Navigator.pop(context, false);
            FocusScope.of(context).previousFocus();
          },
        ),
      ],
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final data = Provider.of<PlayerData>(context, listen: false);
    return (await showDialog(
        context: context,
        builder: (context) {
          if (data.playerLifes == 0) {
            print('this run');
            return RestartGame();
          }
          print('2nd');
          return exitAlertDialog(context);
        }).then((value) {
      if (value) Provider.of<PlayerData>(context, listen: false).restartGame();
      return value;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
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
              children: [PlayerDetails(), Hangman(), DashLines(), Keyboard()],
            ),
          ])),
    );
  }
}
