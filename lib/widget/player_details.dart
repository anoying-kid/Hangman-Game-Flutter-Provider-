import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlayerDetails extends StatefulWidget {
  final int _playerLifes;
  final int _hintsLeft;
  final Function _showHintWord;

  const PlayerDetails(this._playerLifes, this._hintsLeft, this._showHintWord,
      {super.key});

  @override
  State<PlayerDetails> createState() => _PlayerDetailsState();
}

class _PlayerDetailsState extends State<PlayerDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget._playerLifes);
    return Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black))),
        alignment: Alignment.centerLeft,
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(
            20, MediaQuery.of(context).viewPadding.top + 5, 20, 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
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
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.2,
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
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ));
  }
}
