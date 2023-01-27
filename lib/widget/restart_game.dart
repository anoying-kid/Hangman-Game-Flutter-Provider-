import 'package:flutter/material.dart';

class RestartGame extends StatelessWidget {
  const RestartGame({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(),
      backgroundColor: Colors.deepPurple[400],
      title: Text(
        'Restart Game',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.orange),
      ),
      content: Row(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: 50.0,
          // height: MediaQuery.of(context).size.width * 0.3,
          padding: EdgeInsets.only(right: 5),
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: Colors.orange,
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(
              'YES',
              style: TextStyle(color: Colors.deepPurple[400]),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          padding: EdgeInsets.only(left: 5),
          child: OutlinedButton(
            // shape: StadiumBorder(),
            // backgroundColor: Colors.transparent,
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.orange, width: 2)),
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text(
              'NO',
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ),
      ]),
    );
  }
}
