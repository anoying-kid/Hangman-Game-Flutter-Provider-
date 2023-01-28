import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Keyboard extends StatefulWidget {
  final Function(String) onSave;
  final bool readOnly;
  const Keyboard({super.key, required this.onSave, this.readOnly = false});

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  final answerController = TextEditingController();

  void clearTextField() {
    if (answerController.text.isNotEmpty) widget.onSave(answerController.text);
    setState(() {
      answerController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      width: MediaQuery.of(context).size.width / 6,
      height: MediaQuery.of(context).size.height * 0.45,
      child: TextField(
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z]"))],
        readOnly: widget.readOnly,
        onEditingComplete: clearTextField,
        textInputAction: TextInputAction.done,
        cursorColor: Colors.black,
        decoration: const InputDecoration(
            counterText: '',),
        maxLength: 1,
        style: const TextStyle(fontSize: 50),
        autofocus: true,
        controller: answerController,
      ),
    );
  }
}
