import 'package:flutter/material.dart';
import 'package:hangman_game_flutter/provider/player_data.dart';
import 'package:provider/provider.dart';

class Hangman extends StatelessWidget {
  String _hangmanPngPath(String hangmanPngLoc) {
    return 'assets/images/$hangmanPngLoc.png';
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PlayerData>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.33,
      width: double.infinity,
      child: Center(
        child: Image.asset(
          _hangmanPngPath(data.hangmanPngLoc.toString()),
          color: Colors.black,
        ),
      ),
    );
  }
}
