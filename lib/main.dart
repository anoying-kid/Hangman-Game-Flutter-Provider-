import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:hangman_game_flutter/screens/game_screen.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const GameScreen(),
      routes: {GameScreen.routeName: (context) => const GameScreen()},
    );
  }
}
