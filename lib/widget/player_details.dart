import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlayerDetails extends StatefulWidget {
  final int playerLifes;
  const PlayerDetails(this.playerLifes, {super.key});

  @override
  State<PlayerDetails> createState() => _PlayerDetailsState();
}

class _PlayerDetailsState extends State<PlayerDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
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
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.orange, width: 2)),
              child: Row(
                children: 
                [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Image.asset('assets/images/heart.png'),
                    padding: EdgeInsets.all(3),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * ((widget.playerLifes==0) ? 0.2 : 0.1),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      'assets/images/lifes_number/${widget.playerLifes}.svg',
                    ),
                  ),
              ]),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: IconButton(
                    iconSize: 50,
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/images/hint.svg'))),
          ],
        ));
  }
}
