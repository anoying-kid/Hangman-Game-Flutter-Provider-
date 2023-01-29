import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:hangman_game_flutter/screens/game_screen.dart';
import 'package:hangman_game_flutter/screens/level_select_screen.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LevelSelect(),
      routes: {GameScreen.routeName: (context) => GameScreen(difficultyLevel: ModalRoute.of(context)!.settings.arguments as int,)},
    );
  }
}
