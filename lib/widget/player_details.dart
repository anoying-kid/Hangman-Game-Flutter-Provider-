import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hangman_game_flutter/provider/player_data.dart';
import 'package:provider/provider.dart';

class PlayerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PlayerData>(context, listen: false);
    double phoneWidth = MediaQuery.of(context).size.width;
    return Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black))),
        alignment: Alignment.centerLeft,
        height: MediaQuery.of(context).size.height * 0.1,
        width: phoneWidth,
        padding: EdgeInsets.all(phoneWidth * 0.03),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: phoneWidth * 0.4,
              child: Row(children: [
                Container(
                  width: phoneWidth * 0.2,
                  padding: const EdgeInsets.all(3),
                  child: Image.asset('assets/images/heart.png'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width *
                      ((data.playerLifes == 0) ? 0.2 : 0.13),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/images/lifes_number/${data.playerLifes}.svg',
                  ),
                ),
              ]),
            ),
            Container(
              height: double.infinity,
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.25,
              alignment: Alignment.centerLeft,
              child: FloatingActionButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                backgroundColor: Colors.orange[100],
                onPressed: () {
                  if (data.hintsLeft != 0) {
                    data.wantHint();
                  }
                },
                child: Consumer<PlayerData>(
                  builder: (context, data, child) => Text(
                    (data.hintsLeft != 0)
                        ? 'Hint\n+${data.hintsLeft}'
                        : 'No Hint',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              width: MediaQuery.of(context).size.width * 0.25,
              alignment: Alignment.center,
              child: Text(
                data.userScore.toString(),
                overflow: TextOverflow.fade,
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 25, shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 5.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ]),
              ),
            )
          ],
        ));
  }
}
