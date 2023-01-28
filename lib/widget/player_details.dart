import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlayerDetails extends StatefulWidget {
  final int _playerLifes;
  final int _hintsLeft;
  final int _playerScore;
  final Function _showHintWord;

  const PlayerDetails(
      this._playerLifes, this._hintsLeft, this._playerScore, this._showHintWord,
      {super.key});

  @override
  State<PlayerDetails> createState() => _PlayerDetailsState();
}

class _PlayerDetailsState extends State<PlayerDetails> {
  @override
  Widget build(BuildContext context) {
    // print(widget._playerLifes);
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
                      ((widget._playerLifes == 0) ? 0.2 : 0.13),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/images/lifes_number/${widget._playerLifes}.svg',
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
                  if (widget._hintsLeft != 0) widget._showHintWord();
                },
                child: Text(
                  (widget._hintsLeft != 0)
                      ? 'Hint\n+${widget._hintsLeft}'
                      : 'No Hint',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
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
                widget._playerScore.toString(),
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
