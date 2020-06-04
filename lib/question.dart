import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      questionText; // final = value doesn't change after constructor has been initialised

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // .infinity equivalent to 100% on CSS
      margin: EdgeInsets.all(10),
      child: Text(
        // Text widgets only take as much space as they need by default, so need to wrap
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
