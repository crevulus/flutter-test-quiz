import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler; // final = constant value at run time.
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        onPressed: selectHandler,
        color: Colors.amber,
      ),
    );
  }
}
