import 'package:flutter/material.dart';
import 'package:hangman_game_flutter/modal/difficulty.dart';
import 'package:hangman_game_flutter/screens/game_screen.dart';

class LevelSelect extends StatelessWidget {
  const LevelSelect({super.key});

  void navigateToGameScreen(BuildContext context, Difficulty difficulty) {
    Navigator.of(context).pushNamed(GameScreen.routeName, arguments: difficulty);
  }

  Widget _difficultyLevelWidget(BuildContext context, String text, Color textColor, Difficulty difficulty) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.3,
      height: MediaQuery.of(context).size.height * 0.1,
      child: OutlinedButton(
          onPressed: () {
            navigateToGameScreen(context, difficulty);
          },
          style: OutlinedButton.styleFrom(
                side: BorderSide(color: textColor, width: 4)),
          child: Text(text, style: TextStyle(fontSize: 30, color: textColor, fontWeight: FontWeight.bold),),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double widgetHeight = MediaQuery.of(context).size.height * 0.5;
    final double widgetWidth = MediaQuery.of(context).size.height * 0.7;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: SizedBox(
          height: widgetHeight,
          width: widgetWidth,
          // color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: widgetWidth,
                child: const Text('Select difficulty:', style: TextStyle(fontSize: 35, color: Colors.white),),
              ),
              const SizedBox(height: 10,),
              _difficultyLevelWidget(context, 'Easy' , Colors.green, Difficulty.easy),
              const SizedBox(height: 10,),
              _difficultyLevelWidget(context, 'Medium' , Colors.red, Difficulty.medium),
              const SizedBox(height: 10,),
              _difficultyLevelWidget(context, 'Hard' , Colors.orange , Difficulty.hard),
            ],
          ),
        ),
      ),
    );
  }
}
