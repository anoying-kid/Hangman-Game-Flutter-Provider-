import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlayerDetails extends StatefulWidget {
  final int _playerLifes;
  const PlayerDetails(this._playerLifes, {super.key});

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
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: IconButton(
                    iconSize: 50,
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/images/hint.svg'))),
          ],
        ));
  }
}
